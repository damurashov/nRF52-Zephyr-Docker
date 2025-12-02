# Zephyr docker

A docker-based workspace that creates a container with all the dependencies
required for building Zephyr-based projects, while leaving access to the
workspace directory;

- All the dep-s are inside Docker;
- The workspace directory is outside Docker, but Docker has it mapped onto its FS;

# Why

- I sometimes develop on an outdated Ubuntu version which I don't want to change, and I sure as hell don't want to have a headache with pulling upstream versions of CMake, Python, and whatever goodness Zephyr requires;

# Before you start

- make sure you can run Docker as non-root (google "docker without sudo");

# Build the environment


On your host

```
./build.sh
```

On your host

```
cd ~/yourworkspace
git clone <THIS REPO>
./launch.sh
```

Congrats! You're inside. When first time there, launch;

```
cd ~
./nrf-install.sh
```

# How do I test it

```bash
(host)> launch.sh
(container)> cd ~/zephyrproject/zephyr
(container)> west build -b nrf52840dongle/nrf52840/bare samples/basic/blinky
```

# Use

- now you have `zephyrproject/` directory in `~/yourworkspace`.
- `~/yourworkspace/zephyrproject` is mapped into the container's `/home/nrf52/zephyrproject`;
- Just knock yourself with your regular development workflow.
- Once you need to build the project, just call `./launch.sh`, navigate to `~/nrf52/zephyrproject`, and do whatever you want there;

# How it works

- It creates a user with the same UID as you have, so when inside the container, you have rw-access to nRF workspace;
- It mounts a directory into the docker container, so it's shared b/w the host, and the container;
- It runs contained shell as a user called `nrf52` with the same UID as the user on the host;

Please note that the workspace IS NOT a part of the container. You'll have to do it manually
