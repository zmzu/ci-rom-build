#pacman -Syu --noconfirm --needed git python
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
apt-get update -y
apt-get install tmate -y
tmate
#repo init --depth=1 --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-14.1 -g default,-mips,-darwin,-notdefault
#repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
