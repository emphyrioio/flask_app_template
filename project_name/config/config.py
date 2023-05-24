# Change the default configuration class inside __init__.py
# Default configutation ('ConfigDev') is exported as 'Condig'

import os

CONF_DIR = os.path.dirname(os.path.abspath(__file__))
BASE_DIR = os.path.dirname(CONF_DIR)


class ConfigDev:
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = "sqlite:///" + os.path.join(
        BASE_DIR, "dadatabse/artnotaires.db"
    )
    SQLALCHEMY_TRACK_MODIFICATIONS = False


class ConfigProd:
    DEBUG = False
