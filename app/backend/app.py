import os

import psycopg2
from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def home():
    return jsonify(
        {
            "message": "Cloud DevOps Assessment API",
            "status": "running",
        }
    )


@app.route("/health")
def health():
    return jsonify({"status": "healthy"}), 200


@app.route("/database")
def database():
    database_url = os.getenv("DATABASE_URL")

    if not database_url:
        return jsonify(
            {
                "database": "not configured",
                "message": "DATABASE_URL environment variable is missing",
            }
        ), 503

    try:
        connection = psycopg2.connect(database_url, connect_timeout=5)
        cursor = connection.cursor()
        cursor.execute("SELECT version();")
        version = cursor.fetchone()[0]

        cursor.close()
        connection.close()

        return jsonify(
            {
                "database": "connected",
                "version": version,
            }
        )
    except Exception as error:
        return jsonify(
            {
                "database": "connection failed",
                "error": str(error),
            }
        ), 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
