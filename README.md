# ROS 2 Workspace Setup Tools

This repo contains public scripts to set up multi-user development workspaces for ROS 2 at OVGU-NIT.

## Usage

### Create a clean, empty dev workspace
```bash
bash <(wget -qO- https://raw.githubusercontent.com/ovgu-nit/ros2_ws_tools/main/setup_dev_empty.sh)
```
## Alternative

### Create a copy of the local main to play with
```bash
bash <(wget -qO- https://raw.githubusercontent.com/ovgu-nit/ros2_ws_tools/main/setup_dev_copy_local.sh)
```

---

One can oufcourse clone the Main Repo, but this is not advised!
Better to test settings and change one package at a time with the sript `.../scripts/upload_to_main.sh`
