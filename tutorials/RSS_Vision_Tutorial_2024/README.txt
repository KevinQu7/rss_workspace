RSS Vision Tutorial 2024
=========================

Getting Started
===============

Prerequisites
-------------
Make sure you have Docker and Docker Compose installed on your system. If you are using Linux, you may need to use sudo for Docker commands.

Steps to Run the Jupyter Notebook
---------------------------------

1. Start Docker Compose:
   In the directory containing the docker-compose.yml file, run Docker Compose to start the Jupyter Notebook. On Linux, you might need to use sudo:

   sudo docker-compose up

   On macOS or Windows, you can usually run this without sudo:

   docker-compose up

(If you have having permissions on Linux and you are required to use sudo, try to following fix: https://github.com/sindresorhus/guides/blob/main/docker-without-sudo.md)

2. Wait for the Jupyter Notebook to Start:
   After running docker-compose up, wait for the Jupyter Notebook to start. Look for the following message in the terminal output:

   vision_notebook_1  | =======================================================
   vision_notebook_1  | 
   vision_notebook_1  | RobotX Students: Welcome to the Object Detection Jupyter Notebook!
   vision_notebook_1  | 
   vision_notebook_1  | Jupyter Notebook is running!
   vision_notebook_1  | Please open your browser and go to: http://127.0.0.1:8888
   vision_notebook_1  | Use the following token to access the notebook:
   vision_notebook_1  | 70c14d4e47be6a50fbca8864263029cfbeffb2904e039501
   vision_notebook_1  | 
   vision_notebook_1  | =======================================================

3. Open the Jupyter Notebook:
   Open your web browser and navigate to http://127.0.0.1:8888. You will need to enter the token provided in the terminal output to access the notebook.

4. Start Working:
   Once you are logged in, you can start working on the Object Detection Jupyter Notebook.

Troubleshooting
===============

- Docker Command Requires sudo: If you receive a permission error when running Docker commands, try adding sudo at the beginning of the command.
  
- No Such Image Error: If you encounter an error indicating that an image cannot be found, ensure that your Docker Compose file is correctly configured and that you have an active internet connection to pull the image from the Docker registry.

- Container Not Starting: If the container does not start, check the terminal output for any error messages. Ensure that Docker and Docker Compose are properly installed and that there are no conflicting services running on the required ports.

For any additional help, feel free to reach out to the course instructor or consult the Docker and Docker Compose documentation.
