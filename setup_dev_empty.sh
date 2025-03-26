#!/bin/bash

USERNAME=$(whoami)
MAIN_REPO=git@github.com:ovgu-nit/ROS2_Main.git
TARGET_WS="/opt/NIT_ROS2/${USERNAME}_ws"

echo "Cloning main repo into $TARGET_WS..."
git clone "$MAIN_REPO" "$TARGET_WS"

echo "Disconnecting from Git origin..."
rm -rf "$TARGET_WS/.git"

echo "Removing src/ content to give you a clean dev_ws..."
rm -rf "$TARGET_WS/src"/*
mkdir -p "$TARGET_WS/src"

# Link shared libs
if [ -d /opt/NIT_ROS2/libshared ]; then
  mkdir -p "$TARGET_WS/lib"
  ln -sfn /opt/NIT_ROS2/libshared "$TARGET_WS/lib/shared"
fi

cd "$TARGET_WS"
colcon build

# Source in bashrc
if ! grep -q "$TARGET_WS/install/setup.bash" ~/.bashrc; then
  echo "source $TARGET_WS/install/setup.bash" >> ~/.bashrc
fi

echo "✅ Empty user workspace ready at $TARGET_WS"
