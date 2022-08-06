#pacman -Syu --noconfirm --needed git python

apt-get update -y
apt-get install git build-essential -y
apt-get install repo
#sudo curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
#sudo chmod a+rx /usr/local/bin/repo

#wget https://raw.githubusercontent.com/akhilnarang/scripts/master/setup/arch-manjaro.sh && ./arch-manjaro.sh

repo init --depth=1 --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-14.1 -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
