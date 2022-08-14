export DEBIAN_FRONTEND=noninteractive
export USER=buildfarm
TZ=Etc/UTC
apt-get update -y
apt-get install schedtool rsync wget openjdk-8-jdk python imagemagick bc git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig -y
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
wget https://raw.githubusercontent.com/sabmohmaya/new/java/java.security
cp java.security /etc/java-8-openjdk/security/java.security
repo init --no-repo-verify -u https://github.com/LineageOS/android.git -b cm-14.1 --depth=1 -g default,-mips,-darwin,-notdefault
git clone https://github.com/RahifM/local_manifests -b cm-14.1 --depth=1 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
git clone https://github.com/RahifM/proprietary_vendor_xiaomi -b cm-14.1 --depth=1 vendor/xiaomi
. build/env*
time repopick -t n-asb-2021-09
#brunch mido
#cd out/target/product/mido
#curl --upload-file lineage-14.1-20220811-UNOFFICIAL-mido.zip https://transfer.sh/lineage-14.1-20220811-UNOFFICIAL-mido.zip > tup.txt
#$TG -f tup.txt
