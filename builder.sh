set -e
df -h
export DEBIAN_FRONTEND=noninteractive
export USER=buildfarm
export TZ='Asia/Kolkata'
export LC_ALL=C
time sudo apt-get update -y
time sudo apt-get install schedtool rsync wget openjdk-8-jdk python2 imagemagick bc git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig -y
#mkdir ~/bin
#PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo-1 > ~/bin/repo
chmod a+x ~/bin/repo
python --version
java -version
javac -version
git clone https://github.com/fabianonline/telegram.sh $HOME/telegram.sh
wget https://raw.githubusercontent.com/zmzu/ci-rom-build/tgsh/.telegram.sh
mv .telegram.sh $HOME/.telegram.sh
TG=$HOME/telegram.sh/telegram
wget https://raw.githubusercontent.com/RahifM/repo_update/java/java.security
sudo cp java.security /etc/java-8-openjdk/security/java.security
git config --global color.ui false
git config --global user.name RahifM
git config --global user.email rahifmanjatha372@gmail.com
repo init --no-repo-verify -u https://github.com/LineageOS/android.git -b cm-14.1 --depth=1 -g default,-mips,-darwin,-notdefault
git clone https://github.com/RahifM/local_manifests --depth 1 -b cm-14.1 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
df -h
#git clone https://github.com/TheMuppets/proprietary_vendor_wingtech -b cm-14.1 --depth=1 vendor/wingtech
. build/env*
#repopick -t n-asb-2021-09 -f && repopick -t n-asb-2021-10 -f && repopick -t n-asb-2021-11 -f && repopick -t n-asb-2021-12 -f && repopick -t n-asb-2022-01 -f && repopick -t n-asb-2022-02 -f && repopick -t n-asb-2022-03 -f && repopick -t n-asb-2022-04 -f && repopick -t n-asb-2022-05 -f && repopick -t n-asb-2022-06 -f && repopick -t n-asb-2022-07 -f && repopick -t n-asb-2022-08 -f #&& repopick -t n-asb-2022-09
#cd build && wget https://raw.githubusercontent.com/kerneltoast/patcher/cm-14.1-dumpling/patches/build/0010-release-keys.patch && git apply 0010-release-keys.patch && cd ../
#cd external/iw && wget https://raw.githubusercontent.com/RahifM/repo_update/cm-14.1-patches/iw.patch && git apply iw.patch && cd ../..
#git clone https://github.com/LineageOS/android_device_wingtech_wt88047 -b cm-14.1 --depth=1 device/wingtech/wt88047
#git clone https://github.com/LineageOS/android_device_cyanogen_msm8916-common -b cm-14.1 --depth=1 device/cyanogen/msm8916-common
#git clone https://github.com/LineageOS/android_kernel_wingtech_msm8916 -b cm-14.1 --depth=1 kernel/wingtech/msm8916
#git clone https://github.com/LineageOS/android_external_stlport -b cm-14.1 --depth=1 external/stlport
#git clone https://github.com/LineageOS/android_device_qcom_common -b cm-14.1 --depth=1 device/qcom/common
lunch lineage_wt88047-user
#brunch wt88047 > b.txt
#$TG -f b.txt
#cd device/wingtech/wt88047 && wget https://raw.githubusercontent.com/RahifM/repo_update/cm-14.1-patches/wtfp.patch && git apply wtfp.patch && cd ../../..
#make -j$(nproc --all) bacon
make -j$(nproc --all) bootimg
#cd out/target/product/wt88047
#curl --upload-file lineage-14.1-20220906-UNOFFICIAL-wt88047.zip https://transfer.sh/lineage-14.1-20220906-UNOFFICIAL-wt88047.zip > tup.txt
#$TG -f tup.txt
#ls -a
#du -hs *
#du -hs .repo
