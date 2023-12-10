## Build

### 1. Install Docker:

```bash
# Ubuntu / Debian
sudo apt-get update
sudo apt-get install docker.io
```
### 2. Build Docker image:

```bash
docker build -t <image_name> <Dockerfile_path>
docker build -t blade3-Debian-env ./Dockerfile
```
### 3. Install Repo:

```bash
mkdir -p ~/.bin
PATH="${HOME}/.bin:${PATH}"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
chmod a+rx ~/.bin/repo
```
### 4. Download code:

```bash
repo init -u https://github.com/mixtile-rockchip/manifests.git -b master -m rk3588_linux_release.xml
repo sync
```
### 5. Build using Docker:

```bash
docker run --privileged -u root -it --rm -v $PWD:/build blade3-Debian-env
./build.sh chip    # Select rk3588 and rockchip_rk3588_blade3_v101_defconfig
./build.sh all
```
### 6. Build output:

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
