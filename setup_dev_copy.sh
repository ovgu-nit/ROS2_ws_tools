#!/bin/bash

USERNAME=$(whoami)
SOURCE="/opt/NIT_ROS2/main_ws"
TARGET="/opt/NIT_ROS2/${USERNAME}_ws"

echo "Copying workspace from $SOURCE to $TARGET..."
cp -r "$SOURCE" "$TARGET"

echo "Disconnecting from Git origin..."
rm -rf "$TARGET/.git"

echo "Cleaning build artifacts..."
rm -rf "$TARGET/build" "$TARGET/install" "$TARGET/log"

# Link shared libs
if [ -d /opt/NIT_ROS2/libshared ]; then
  mkdir -p "$TARGET/lib"
  ln -sfn /opt/NIT_ROS2/libshared "$TARGET/lib/shared"
fi

cd "$TARGET"
colcon build

# Source in bashrc
if ! grep -q "$TARGET/install/setup.bash" ~/.bashrc; then
  echo "source $TARGET/install/setup.bash" >> ~/.bashrc
fi

echo "✅ Copied user workspace ready at $TARGET"
