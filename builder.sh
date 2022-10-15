df -h
export DEBIAN_FRONTEND=noninteractive
TZ=Etc/UTC
time apt-get update -y
time apt-get install wget virtualenv rsync python python3.8 imagemagick bc git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig -y
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
git clone https://github.com/fabianonline/telegram.sh --depth=1 $HOME/telegram.sh
wget https://raw.githubusercontent.com/sabmohmaya/mido/staging/slmk-4.4/lineage-15.1/.telegram.sh
mv .telegram.sh $HOME/.telegram.sh
TG=$HOME/telegram.sh/telegram
time repo init --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-18.1 --depth=1 -g default,-mips,-darwin,-notdefault
git clone https://github.com/ramimrashid/local_manifest -b los --depth 1 .repo/local_manifests
time repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j12
echo "BREAK..."
ls device/google
echo "BREAK..."
ls kernel/google
echo "BREAK..."
ls vendor/google
echo "BREAK..."
ls packages/apps
echo "BREAK..."
. build/env*
time lunch lineage_coral-userdebug
