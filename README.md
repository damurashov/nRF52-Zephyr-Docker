# nRF connect docker

A docker-based workspace that creates a container with all the dependencies
required for building Zephyr-based projects, while leaving access to the
workspace directory;

- All the dep-s are inside Docker;
- The workspace directory is outside Docker;

# Why

- I sometimes run this on an outdated Ubuntu version, and I sure as hell don't want to have a headache with pulling upstream versions of CMake, Python, and whatnot;

# Before you start

- make sure you can run Docker as non-root (google "docker without sudo");

# Build the environment

```
./build.sh
```

On your host

```
cd ~/yourworkspace
git clone <THIS REPO>
./launch.sh
```

Now you're in the container.

```
cd ~
./nrf-install.sh
```

# Use

- now you have `zephyrproject/` directory in `~/yourworkspace`. 
- `~/yourworkspace/zephyrproject` is mapped into the container's `/home/nrf52/zephyrproject`;
- Just knock yourself with your regular development workflow. 
- Once you need to build the project, just call `./launch.sh`, navigate to `~/nrf52/zephyrproject`, and do whatever you want there

# How it works

- It creates a user with the same UID as you have, so when inside the container, you have access to nRF workspace;
- It mounts a directory into the docker container;
- It runs contained shell as user `nrf52` with the same UID as the user on the host;
