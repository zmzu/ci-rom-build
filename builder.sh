apt-get update -y
apt-get install bc python openjdk-8-jdk git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig curl schedtool imagemagick -y
#ln -s /usr/bin/python3.8 /usr/bin/python
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo-1 > ~/bin/repo
chmod a+x ~/bin/repo
python --version
java -version
javac -version
repo init --repo-branch=repo-1 --no-repo-verify -u https://github.com/LineageOS/android.git -b cm-14.1 --depth=1 -g default,-mips,-darwin,-notdefault
#repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
git clone https://github.com/RahifM/proprietary_vendor_xiaomi -b cm-14.1 --depth=1 vendor/xiaomi
cd vendor/xiaomi && git status
#cd external/iw && git status && git fetch --unshallow && git status && cd ../..
#df -h
export USE_NINJA=false
#rm -rf ~/.jack*
#./prebuilts/sdk/tools/jack-admin kill-server
#./prebuilts/sdk/tools/jack-admin start-server
#. build/env* && lunch lineage_mido-userdebug && brunch mido
