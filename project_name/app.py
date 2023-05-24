from flask import Flask

from .config import Config
from .extensions import db, migrates
from .routes import routes

app = Flask(__name__)

# Loading configuration.
app.config.from_object(Config)

# Initilizing routes.
routes.init_app(app)

# Initializing the database.
db.init_app(app)

# Setting up migrations.
migrates.init_app(app, db)
