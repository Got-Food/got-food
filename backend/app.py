from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import os

app = Flask(__name__)

# Connect using DATABASE_URL from docker-compose
app.config["SQLALCHEMY_DATABASE_URI"] = os.environ.get("DATABASE_URL")
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

db = SQLAlchemy(app)

# Example model
class FoodPantry(db.Model):
    __tablename__ = "food_pantries"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    address = db.Column(db.String(255), nullable=False)

@app.route("/")
def home():
    return "Got Food backend running with PostgreSQL 🚀"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)