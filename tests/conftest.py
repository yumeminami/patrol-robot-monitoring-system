from app.main import create_app
import pytest
from fastapi.testclient import TestClient
import os
os.environ["ENV"] = "test"


@pytest.fixture(scope="module")
def test_app():
    os.environ["ENV"] = "test"
    app = create_app()
    return TestClient(app)
