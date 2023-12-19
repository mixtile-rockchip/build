## Build

### 1. Install Docker

```bash
# Ubuntu / Debian
sudo apt-get update
sudo apt-get install docker.io
```
### 2. Build Docker image

```bash
git clone https://github.com/mixtile-rockchip/build.git
cd build
sudo docker build -t blade3-debian-env ./
```
```bash
# View the built docker image
blade3:mixtile~/build$ sudo docker images
REPOSITORY          TAG       IMAGE ID       CREATED         SIZE
blade3-debian-env   latest    ad587023e07a   3 minutes ago   1.7GB
ubuntu              20.04     83a4bf3bb050   2 weeks ago     72.8MB
```
### 3. Install Repo

```bash
# repo depends on python3, make sure you have a python3 environment before using it
# sudo apt-get install -y python3 && sudo ln -snf /usr/bin/python3 /usr/bin/python
mkdir -p ~/.bin
PATH="${HOME}/.bin:${PATH}"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
chmod a+rx ~/.bin/repo
```
### 4. Download code

```bash
# Before downloading git, install git tool and configure Git information
# sudo apt-get install -y git git-lfs
# git config --global user.email "you@example.com"
# git config --global user.name "Your Name"
# You can create a new blade3 directory and do the following
mkdir blade3 && cd blade3
repo init -u https://github.com/mixtile-rockchip/manifests.git -b master -m rk3588_linux_release.xml
repo sync
```
### 5. Build using Docker

```bash
# You need to execute the following command in the source directory, the blade3 directory
sudo docker run --privileged -u root -it --rm -v $PWD:/build blade3-debian-env
cd /build
./build.sh chip    # Follow the prompts to select rk3588 and rockchip_rk3588_blade3_v101_defconfig
./build.sh all
```
### 6. Build output

```bash
Directory: output/update/Image
.
├── boot.img -> ../../../kernel/boot.img
├── MiniLoaderAll.bin -> ../../../u-boot/rk3588_spl_loader_v1.13.112.bin
├── misc.img -> ../../firmware/misc.img
├── oem.img -> ../../firmware/oem.img
├── package-file
├── parameter.txt -> ../../../device/rockchip/.chips/rk3588/parameter.txt
├── recovery.img -> ../../../buildroot/output/rockchip_rk3588_recovery/images/recovery.img
├── rootfs.img -> ../../../debian/linaro-rootfs.img
├── uboot.img -> ../../../u-boot/uboot.img
├── update.img
├── update.raw.img
└── userdata.img -> ../../firmware/userdata.img
```
### 7. Upgrade Firmware
[`look here`](https://www.mixtile.com/categories/upgrade-firmware/)
