from datetime import datetime, timedelta


def parse_execution_time(execution_time):
    # 支持多种时间格式
    formats = ["%H:%M:%S", "%H:%M"]
    eta_time = None  # 设置默认值

    for fmt in formats:
        try:
            # 尝试使用当前格式解析时间字符串
            eta_time = datetime.strptime(execution_time, fmt).time()
            break
        except ValueError:
            continue

    if eta_time is None:
        raise ValueError("Invalid time format: {}".format(execution_time))

    # 获取当前日期
    current_date = datetime.now().date()

    # 创建 datetime 对象，日期为当前日期，时间为解析得到的时间
    eta_time = datetime.combine(current_date, eta_time)

    # 如果解析得到的时间已经过去，则将日期加一天
    if eta_time < datetime.now():
        eta_time = eta_time + timedelta(days=1)

    # 转为UTC时间
    eta_time = eta_time - timedelta(hours=8)

    return eta_time
