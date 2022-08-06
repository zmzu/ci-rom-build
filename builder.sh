#pacman -Syu --noconfirm --needed git python
apt-get update -y
export REPO=$(mktemp /tmp/repo.XXXXXXXXX)
curl -o ${REPO} https://storage.googleapis.com/git-repo-downloads/repo
gpg --recv-key 8BB9AD793E8E6153AF0F9A4416530D5E920F5C65
curl -s https://storage.googleapis.com/git-repo-downloads/repo.asc | gpg --verify - ${REPO} && install -m 755 ${REPO} ~/bin/repo
#apt-get install repo -y
#sudo curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
#sudo chmod a+rx /usr/local/bin/repo
#wget https://raw.githubusercontent.com/akhilnarang/scripts/master/setup/arch-manjaro.sh && ./arch-manjaro.sh
repo init --depth=1 --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-14.1 -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
