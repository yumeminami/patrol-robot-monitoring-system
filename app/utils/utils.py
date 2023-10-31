import json


PANORAMA_VIDEO_TIME_DICT_PATH = "app/json_file/panorama_video_time_dict.json"


def position_to_time(position):
    with open(PANORAMA_VIDEO_TIME_DICT_PATH, "r") as fr:
        data = json.load(fr)

    i = 0
    section_list = []
    time_list = []
    while i < len(data["robot_state"]):
        section = []
        times = []
        if data["robot_state"][i] == 1 and (i + 1) < len(data["robot_state"]):
            section.append(data["position"][i])
            section.append(data["position"][i + 1])
            times.append(data["time"][i])
            times.append(data["time"][i + 1])
            i += 2
            section_list.append(section)
            time_list.append(times)
        else:
            i += 1

    pos_min = min(data["position"])
    pos_max = max(data["position"])
    if position > pos_max or position < pos_min:
        print("could not find the position")
        return None
    else:
        for i in range(len(section_list)):
            if (section_list[i][0] - position) * (
                section_list[i][1] - position
            ) < 0:
                p = (position - section_list[i][0]) / (
                    section_list[i][1] - section_list[i][0]
                )
                t = time_list[i][0] + (time_list[i][1] - time_list[i][0]) * p
                return int(t)
        return None
