import os

import redis

from app.utils.log import logger

logger.info("Connecting to redis...")
redis_client = redis.Redis(
    host="redis",
    port=6379,
    db=0,
    password=os.environ.get("REDIS_PASSWORD", "sample_password"),
    decode_responses=True,
)
logger.info("Connected to redis!")
