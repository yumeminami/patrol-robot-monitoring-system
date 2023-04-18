import pymongo
from schemas import tasks, checkpoint, sensor, vision_algorithm
myclient = pymongo.MongoClient("mongodb://root:example@localhost:27017/")
mydn = myclient["patrol-robot-monitoring-system"]
mycol = mydn["tasks"]

task = tasks.Task(
    type=1,
    checkpoint=[checkpoint.Checkpoint(
        id=1,
        position="1",
        speed=1
    ),
        checkpoint.Checkpoint(
        id=2,
        position="2",
        speed=2
    )],
    robot_id=1,
    sensors=[sensor.Sensor(
        name="1",
        low_threshold=1,
        upper_threshold=1
    ),
        sensor.Sensor(
        name="2",
        low_threshold=2,
        upper_threshold=2
    )],
    vision_algorithms=[vision_algorithm.VisionAlgorithm(
        name="1",
        sensitivity=1,
    ),
        vision_algorithm.VisionAlgorithm(
        name="2",
        sensitivity=2,
    )],
    status=1,
    start_time="2021-01-01 00:00:00",
    is_everyday=True
)

x = mycol.insert_one(task.dict())
# mydb = myclient["runoobdb"]

# mycol = mydb["sites"]


# mydict = { "name": "RUNOOB", "alexa": "10000", "url": "https://www.runoob.com" }

# x = mycol.insert_one(mydict)
# print(x)
# print(x)
