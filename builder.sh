set -e
df -h
export DEBIAN_FRONTEND=noninteractive
TZ=Etc/UTC
time sudo apt-get update -y
time sudo apt-get install wget virtualenv rsync imagemagick bc git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils libssl-dev xsltproc unzip fontconfig -y
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
git config --global color.ui false
git config --global user.name RahifM
git config --global user.email rahifmanjatha372@gmail.com
time repo init --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-18.1 --depth=1 -g default,-mips,-darwin,-notdefault --git-lfs
time git clone https://github.com/RahifM/local_manifests -b lineage-18.1-beryllium --depth 1 .repo/local_manifests
time repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j12
. build/env*
time lunch lineage_beryllium-user
#time mka bacon
cd device/xiaomi/sdm845-common
git reset --hard
cd external/chromium-webview/prebuilt/arm
git log
