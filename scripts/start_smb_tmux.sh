#!/bin/bash

# if [ "$#" -ne 1 ]; then
#   echo "Usage: $0 <session_name>"
#   exit 1
# fi

SESSION_NAME="${1:-smb_tmux}"

ROOT=$(dirname "$(dirname "$(readlink -f $0)")")
TMUX_CONFIG="${ROOT}/.tmux.conf"

# Check if a tmux session named "smb_tmux" already exists
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
  # If the session exists, attach to it
  tmux attach-session -t $SESSION_NAME
else
  # If the session doesn't exist, create a new one and load the config file
  tmux -f $TMUX_CONFIG new-session -d -s $SESSION_NAME

  # # # Set up a new window with wssetup and ROS_HOSTNAME
  # bind-key c new-window "wssetup; export ROS_HOSTNAME=localhost; exec $SHELL"

  # # # Set up a new pane with wssetup and ROS_HOSTNAME
  # bind-key % split-window -h "wssetup; export ROS_HOSTNAME=localhost; exec $SHELL"
  # bind-key \" split-window -v "wssetup; export ROS_HOSTNAME=localhost; exec $SHELL"

  # Split the window into three panes
  tmux split-window -h

  tmux select-pane -t 0
  tmux split-window -v
  tmux select-pane -t 2
  tmux split-window -v

  # Set the title of each pane
  tmux select-pane -t $SESSION_NAME:0.0 -T "Gazebo"
  tmux select-pane -t $SESSION_NAME:0.1 -T "Object Detection"
  tmux select-pane -t $SESSION_NAME:0.2 -T "Custom Command"

  # Send the command to panes
  # tmux send-keys -t $SESSION_NAME:0.0 'wssetup && roslaunch smb_gazebo sim.launch launch_gazebo_gui:=true keyboard_teleop:=true'
  # tmux send-keys -t $SESSION_NAME:0.1 'wssetup && roslaunch object_detection object_detection.launch gpu:=off'
  # tmux send-keys -t $SESSION_NAME:0.2 'wssetup && command

  
  # Attach to the new session
  tmux attach-session -t $SESSION_NAME
fi
