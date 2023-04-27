import pytest
from fastapi.testclient import TestClient
import os
import sys

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
os.environ["ENV"] = "test"
from app.main import create_app


@pytest.fixture(scope="module")
def test_app():
    os.environ["ENV"] = "test"
    app = create_app()
    return TestClient(app)
