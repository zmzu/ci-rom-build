set -e
df -h
export DEBIAN_FRONTEND=noninteractive
export TZ='Asia/Kolkata'
time sudo apt-get update -y
time sudo apt-get install wget virtualenv rsync python2 imagemagick bc git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig -y
#mv /usr/bin/python $HOME
#ln -s /usr/bin/python3.8 /usr/bin/python
#mkdir ~/bin
#PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
python --version
git clone https://github.com/fabianonline/telegram.sh --depth=1 $HOME/telegram.sh
wget https://raw.githubusercontent.com/zmzu/ci-rom-build/tgsh/.telegram.sh
mv .telegram.sh $HOME/.telegram.sh
TG=$HOME/telegram.sh/telegram
git config --global color.ui false
git config --global user.name RahifM
git config --global user.email rahifmanjatha372@gmail.com
time repo init --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-16.0 --depth=1 -g default,-mips,-darwin,-notdefault
git clone https://github.com/RahifM/local_manifests --depth 1 -b lineage-16.0 .repo/local_manifestsgit clone https://github.com/RahifM/local_manifests --depth 1 -b lineage-16.0 .repo/local_manifests
#virtualenv -p python2 ~/python
#. ~/python/bin/activate
#python --version
time repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
#time git clone https://github.com/LineageOS/android_device_xiaomi_beryllium -b lineage-16.0 --depth=1 device/xiaomi/beryllium
#time git clone https://github.com/LineageOS/android_device_xiaomi_sdm845-common -b lineage-16.0 --depth=1 device/xiaomi/sdm845-common
#time git clone https://github.com/LineageOS/android_kernel_xiaomi_sdm845 -b lineage-16.0 --depth=1 kernel/xiaomi/sdm845
#time git clone https://github.com/LineageOS/android_packages_resources_devicesettings -b lineage-16.0 --depth=1 packages/resources/devicesettings
#time git clone https://github.com/RahifM/proprietary_vendor_xiaomi -b lineage-16.0 --depth=1 vendor/xiaomi
. build/env*
time lunch lineage_beryllium-userdebug
#mka bacon
#brunch beryllium
