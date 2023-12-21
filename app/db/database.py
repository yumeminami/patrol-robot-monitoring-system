from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

from app.settings import config
from app.utils.log import logger

SQLALCHEMY_DATABASE_URL = config.DATABASE_URL

logger.info("Connecting to database...")
engine = create_engine(SQLALCHEMY_DATABASE_URL,pool_size=100, max_overflow=20)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
logger.info("Connected to database!")

Base = declarative_base()


def init_db():
    Base.metadata.create_all(bind=engine)
