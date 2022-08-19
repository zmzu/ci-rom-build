df -h
export DEBIAN_FRONTEND=noninteractive
TZ=Etc/UTC
time apt-get update -y
time apt-get install wget virtualenv rsync python python3.8 imagemagick bc git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig -y
mv /usr/bin/python $HOME
ln -s /usr/bin/python3.8 /usr/bin/python
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
python --version
git clone https://github.com/fabianonline/telegram.sh --depth=1 $HOME/telegram.sh
wget https://raw.githubusercontent.com/sabmohmaya/mido/staging/slmk-4.4/lineage-15.1/.telegram.sh
mv .telegram.sh $HOME/.telegram.sh
TG=$HOME/telegram.sh/telegram
time repo init --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-16.0 --depth=1 -g default,-mips,-darwin,-notdefault
virtualenv -p python2 ~/python
. ~/python/bin/activate
python --version
time repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j12
time git clone https://github.com/TheScarastic/android_device_xiaomi_mido -b lineage-16.0 --depth=1 device/xiaomi/mido
time git clone https://github.com/TheScarastic/android_device_xiaomi_msm8953-common -b lineage-16.0 --depth=1 device/xiaomi/msm8953-common
time git clone https://github.com/TheScarastic/android_kernel_xiaomi_msm8953 -b lineage-15.1 --depth=1 kernel/xiaomi/msm8953
time git clone https://github.com/LineageOS/android_packages_resources_devicesettings -b lineage-16.0 --depth=1 packages/resources/devicesettings
time git clone https://github.com/TheScarastic/proprietary_vendor_xiaomi -b lineage-16.0 --depth=1 vendor/xiaomi
rm -rf vendor/qcom/opensource/data-ipa-cfg-mgr
rm -rf vendor/qcom/opensource/interfaces
git clone https://github.com/LineageOS/android_vendor_qcom_opensource_interfaces -b lineage-15.1 --depth=1 vendor/qcom/opensource/interfaces
rm -rf external/tinycompress
git clone https://github.com/LineageOS/android_external_tinycompress -b lineage-15.1 --depth=1 external/tinycompress
rm -rf hardware/qcom/display-caf/msm8996
git clone https://github.com/LineageOS/android_hardware_qcom_display -b lineage-15.1-caf-8996 --depth=1 hardware/qcom/display-caf/msm8996
rm -rf hardware/qcom/audio-caf/msm8996
git clone https://github.com/LineageOS/android_hardware_qcom_audio -b lineage-15.1-caf-8996 --depth=1 hardware/qcom/audio-caf/msm8996
rm -rf hardware/qcom/media-caf/msm8996
git clone https://github.com/LineageOS/android_hardware_qcom_media -b lineage-15.1-caf-8996 --depth=1 hardware/qcom/media-caf/msm8996
cd frame*/native
wget https://raw.githubusercontent.com/RahifM/frameworks_native/sf-patches/sf.patch && git apply sf.patch
cd ../../vendor/lineage
wget https://raw.githubusercontent.com/RahifM/frameworks_native/sf-patches/vsf.patch && git apply vsf.patch
cd ../..
. build/env*
#time lunch lineage_mido-userdebug
brunch mido
