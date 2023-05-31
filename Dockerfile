FROM ros:noetic as app

# Set work directory
WORKDIR /app

# Copy app
COPY . /app
COPY requirements.txt /app


# RUN cat /etc/apt/sources.list 
RUN rm /etc/apt/sources.list.d/ros1-latest.list

# Replace the official sources list with a Chinese mirror
RUN echo "deb http://mirrors.ustc.edu.cn/ubuntu/ focal main restricted universe multiverse" > /etc/apt/sources.list \
 && echo "deb http://mirrors.ustc.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list \
 && echo "deb http://mirrors.ustc.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list \
 && echo "deb http://mirrors.ustc.edu.cn/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list

# Install python pip

RUN apt-get update && apt-get install -y python3-pip

# # Install python dependencies
RUN pip3 install -r requirements.txt

RUN useradd -ms /bin/bash ubuntu

# Set ubuntu user as the owner of the app directory
RUN chown -R ubuntu:ubuntu /app

# # Switch to ubuntu user
# USER ubuntu


# Expose port
EXPOSE 8000


CMD ["python3", "app/main.py"]


# Start from the ROS Foxy ROS1 bridge image
FROM ros:noetic as ros_core

# Set the working directory
WORKDIR /home/ros

RUN useradd -ms /bin/bash ubuntu

# Run the ROS1 bridge when the container starts
CMD ["roscore"]
