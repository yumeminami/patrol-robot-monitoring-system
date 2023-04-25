from app.schemas.tasks import TaskCreate, TaskUpdate, Task
from app.crud.tasks import task as crud
from app.api.api import create_generic_router

router = create_generic_router(crud, TaskCreate, TaskUpdate, Task)
