set -e
export DEBIAN_FRONTEND=noninteractive
export USER=buildfarm
export TZ='Asia/Kolkata'
sudo apt-get update -y
sudo apt-get install rsync wget openjdk-8-jdk python imagemagick bc git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig -y
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
repo init --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-15.1 --depth=1 -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
git clone https://github.com/RahifM/proprietary_vendor_xiaomi -b lineage-15.1 --depth=1 vendor/xiaomi
cd build/make && wget https://raw.githubusercontent.com/RahifM/repo_update/lineage-15.1-patches/relkey.patch && git apply relkey.patch && cd ../..
. build/env*
#brunch mido
lunch lineage_mido-user
mka bacon
#cd out/target/product/mido
#curl --upload-file lineage-15.1-20220906-UNOFFICIAL-mido.zip https://transfer.sh/lineage-15.1-20220906-UNOFFICIAL-mido.zip > tup.txt
#$TG -f tup.txt
