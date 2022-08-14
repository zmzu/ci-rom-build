export DEBIAN_FRONTEND=noninteractive
TZ=Etc/UTC
time apt-get update -y
time apt-get install virtualenv rsync python python3.8 imagemagick bc git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig -y
mv /usr/bin/python $HOME
ln -s /usr/bin/python3.8 /usr/bin/python
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
python --version
time repo init --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-16.0 --depth=1 -g default,-mips,-darwin,-notdefault
virtualenv -p python2 ~/python
. ~/python/bin/activate
python --version
#time repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
#time git clone https://github.com/RahifM/proprietary_vendor_xiaomi -b lineage-16.0 --depth=1 vendor/xiaomi
#. build/env* && brunch beryllium
