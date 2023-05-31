<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://gitee.com/ZJCXJSLtd/patrol-robot-monitoring-system-cpy">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Patrol-Robot-Monitoring-System</h3>
  <strong>English</strong> | <a href="./README_CN.md">简体中文</a>
  <p align="center">
    <br />
    <a href="https://gitee.com/ZJCXJSLtd/patrol-robot-monitoring-system-cpy"><strong>Explore the project »</strong></a>
    <br />
    <br />
    <a href="https://gitee.com/ZJCXJSLtd/patrol-robot-monitoring-system-cpy">Quick Start</a>
    ·
    <a href="https://gitee.com/ZJCXJSLtd/patrol-robot-monitoring-system-cpy/issues">Report Bug</a>
    ·
    <a href="https://gitee.com/ZJCXJSLtd/patrol-robot-monitoring-system-cpy/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#design">Design</a></li>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

The patrol robot system is an advanced system specially designed for remote monitoring and surveillance in various environments. The system is designed to provide real-time information on the status, location and activity of patrol robotic systems.

The system is also equipped with a range of advanced features including alarm management, data collection, data storage and data analysis. These capabilities allow the system to generate alerts based on predefined rules and analyze collected data to identify trends, anomalies and potential problems.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Design

![Image text](images/design.png)

### Built With

This project is built using several technologies, including:

1. **ROS** (Robot Operating System): A flexible framework for writing robot software. It's a collection of tools, libraries, and conventions that simplify the task of creating complex and robust robot behavior.

2. **FastAPI**: A modern, fast (high-performance), web framework for building APIs with Python 3.6+ based on standard Python type hints.

3. **Celery**: An asynchronous task queue/job queue based on distributed message passing. It is focused on real-time operation but supports scheduling as well.

4. **Redis**: An open source (BSD licensed), in-memory data structure store, used as a database, cache, and message broker.

5. **MySQL**: An open-source relational database management system.

These tools and technologies work together to form the backbone of our project, providing a robust, scalable, and efficient platform for our needs.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

To run this project, you need:
- Install [Docker](https://docs.docker.com/get-docker/)

### Installation

_Below is an example of how you can instruct your audience on installing and setting up your app._

1. Clone the repo
   ```sh
   git clone https://gitee.com/ZJCXJSLtd/patrol-robot-monitoring-system-cpy.git
   ```
2. Navigate to the project directory
   ```sh
   cd patrol-robot-monitoring-system-cpy
   ```
3. Build the images
   ```sh
   docker compose build 
   ```


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used.

_This project is developed based on ROS (Robot Operating System). Since the ROS official website does not provide the installation of the MacOS operating system, this image cannot run on the MacOS operating system._

1. Start the services
   ```sh
   docker compose up -d
   ```
2. Check the services
   ```sh
   docker ps
   
   CONTAINER ID   IMAGE          COMMAND                  CREATED       STATUS       PORTS                               NAMES
   c0ea67aa47a6   417106dd6a74   "/ros_entrypoint.sh …"   6 hours ago   Up 6 hours   0.0.0.0:8000->8000/tcp              app
   b048af054ece   53211154db2f   "/ros_entrypoint.sh …"   6 hours ago   Up 6 hours                                       ros_core
   2ba53f0125c7   417106dd6a74   "/ros_entrypoint.sh …"   6 hours ago   Up 6 hours   8000/tcp                            patrol-robot-monitoring-system-celery-worker-1
   a249f6aa1715   mysql:8.0      "docker-entrypoint.s…"   6 hours ago   Up 6 hours   0.0.0.0:3306->3306/tcp, 33060/tcp   patrol-robot-monitoring-system-db-1
   c1532e06141d   redis:latest   "docker-entrypoint.s…"   6 hours ago   Up 6 hours   0.0.0.0:6379->6379/tcp              redis
   ```
 3. Visit the http://localhost:8000/docs to browser the APIs.


   
<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the GNU General Public License v3.0. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

* [FastAPI](https://fastapi.tiangolo.com/)
* [ROS](http://wiki.ros.org/)
* [Docker](https://docs.docker.com/)
* [Celery](https://github.com/celery/celery)
* [Redis](https://redis.io/)
* [MySQL](https://www.mysql.com/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
