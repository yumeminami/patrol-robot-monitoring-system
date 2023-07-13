import os

import redis

from .log import logger

logger.info("Connecting to redis...")
redis_client = redis.Redis(
    host="redis",
    port=6379,
    db=0,
    password=os.environ.get("REDIS_PASSWORD", "sample_password"),
)
logger.info("Connected to redis!")
