set -e
export DEBIAN_FRONTEND=noninteractive
export USER=buildfarm
export TZ='Asia/Kolkata'
time sudo apt-get update -y
time sudo apt-get install schedtool rsync wget openjdk-8-jdk python imagemagick bc git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig -y
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo-1 > ~/bin/repo
chmod a+x ~/bin/repo
python --version
java -version
javac -version
git clone https://github.com/fabianonline/telegram.sh $HOME/telegram.sh
wget https://raw.githubusercontent.com/sabmohmaya/mido/staging/slmk-4.4/lineage-15.1/.telegram.sh
mv .telegram.sh $HOME/.telegram.sh
TG=$HOME/telegram.sh/telegram
wget https://raw.githubusercontent.com/RahifM/repo_update/java/java.security
cp java.security /etc/java-8-openjdk/security/java.security
repo init --no-repo-verify -u https://github.com/LineageOS/android.git -b cm-14.1 --depth=1 -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
git clone https://github.com/TheMuppets/proprietary_vendor_wingtech -b cm-14.1 --depth=1 vendor/wingtech
. build/env*
repopick -t n-asb-2021-09 && repopick -t n-asb-2021-10 && repopick -t n-asb-2021-11 && repopick -t n-asb-2021-12 && repopick -t n-asb-2022-01 && repopick -t n-asb-2022-02 && repopick -t n-asb-2022-03 && repopick -t n-asb-2022-04 && repopick -t n-asb-2022-05 && repopick -t n-asb-2022-06 && repopick -t n-asb-2022-07 && repopick -t n-asb-2022-08 && repopick -t n-asb-2022-09
cd build && wget https://raw.githubusercontent.com/kerneltoast/patcher/cm-14.1-dumpling/patches/build/0010-release-keys.patch && git apply 0010-release-keys.patch && cd ../
cd external/iw && wget https://raw.githubusercontent.com/RahifM/repo_update/cm-14.1-patches/iw.patch && git apply iw.patch && cd ../..
lunch lineage_wt88047-user
cd device/wingtech/wt88047 && wget https://raw.githubusercontent.com/RahifM/repo_update/cm-14.1-patches/wtfp.patch && git apply wtfp.patch && cd ../../..
#make -j$(nproc --all) bacon
cd out/target/product/wt88047
curl --upload-file lineage-14.1-20220906-UNOFFICIAL-wt88047.zip https://transfer.sh/lineage-14.1-20220906-UNOFFICIAL-wt88047.zip > tup.txt
$TG -f tup.txt
