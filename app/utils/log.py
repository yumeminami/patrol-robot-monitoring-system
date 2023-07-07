import logging
import colorlog
import multiprocessing
from logging.handlers import QueueHandler

logger = logging.getLogger()
logger.setLevel(logging.DEBUG)

console_handler = logging.StreamHandler()
console_handler.setFormatter(
    colorlog.ColoredFormatter(
        "%(log_color)s%(levelname)s:%(message)s",
        log_colors={
            "DEBUG": "blue",
            "INFO": "green",
            "WARNING": "yellow",
            "ERROR": "red",
            "CRITICAL": "bg_red,bold_white",
        },
    )
)

logger.addHandler(console_handler)

log_queue = multiprocessing.Queue()
log_listener = logging.handlers.QueueListener(log_queue, console_handler)
log_listener.start()
