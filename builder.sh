
apt-get update -y
apt-get install build-essential curl python3.8 schedtool git -y
ln -s /usr/bin/python3.8 /usr/bin/python
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
python --version
repo init --depth=1 --no-repo-verify -u https://github.com/LineageOS/android.git -b cm-14.1 -g default,-mips,-darwin,-notdefault
time repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
git clone https://github.com/RahifM/proprietary_vendor_xiaomi -b cm-14.1 --depth=1 vendor/xiaomi
. build/env*
lunch lineage_mido-userdebug
brunch mido
