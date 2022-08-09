export DEBIAN_FRONTEND=noninteractive
TZ=Etc/UTC
time apt-get update -y
time apt-get install wget openjdk-8-jdk python imagemagick bc git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig -y
#apt-get install bc python openjdk-8-jdk git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig curl schedtool imagemagick -y
#ln -s /usr/bin/python3.8 /usr/bin/python
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo-1 > ~/bin/repo
chmod a+x ~/bin/repo
python --version
java -version
javac -version
wget https://raw.githubusercontent.com/TinkerBoard-Android/docker_builder/dddd9b3a9847a0dfc48f6b5bd5613f1c6006140a/java.security
cp java.security /etc/java-8-openjdk/security/java.security
time repo init --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-15.1 --depth=1 -g default,-mips,-darwin,-notdefault
time repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
time git clone https://github.com/RahifM/proprietary_vendor_xiaomi -b lineage-15.1 --depth=1 vendor/xiaomi
. build/env* && brunch mido
