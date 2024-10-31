#!/bin/sh

# Mengecek Ruang Drive yang Digunakan oleh File Cache
echo "Memeriksa ruang yang digunakan oleh file cache di /var/cache/apt/archives..."
du -sh /var/cache/apt/archives

# Membersihkan semua file log
echo "Membersihkan semua file log di /var/log..."
logs=`find /var/log -type f`
for i in $logs
do
  echo "Mengosongkan $i..."
  > $i
done

# Menghapus paket parsial
echo "Menghapus paket parsial..."
apt-get clean && apt-get autoclean
echo "Menghapus software-properties-common..."
apt-get remove --purge -y software-properties-common

# Menghapus paket yang tidak lagi dibutuhkan
echo "Menghapus paket yang tidak lagi dibutuhkan..."
apt-get autoremove -y

# Mengecek dan memasang deborphan jika belum ada
if ! command -v deborphan &> /dev/null
then
    echo "deborphan tidak ditemukan. Memasang deborphan..."
    apt-get update
    apt-get install -y deborphan
fi

# Menghapus paket yatim piatu (orphaned packages)
echo "Menghapus paket yatim piatu..."
deborphan | xargs sudo apt-get -y remove --purge

# Membersihkan cache paket yang diunduh
echo "Membersihkan cache paket yang diunduh..."
apt-get clean

# Menghapus file di tempat sampah (Trash)
echo "Menghapus file di tempat sampah..."
rm -rf /home/*/.local/share/Trash/*/**
rm -rf /root/.local/share/Trash/*/**

# Menghapus halaman manual (man pages)
echo "Menghapus halaman manual..."
rm -rf /usr/share/man/?? 
rm -rf /usr/share/man/??_*

# Menghapus semua file .gz dan file log yang telah diputar (rotated files)
echo "Menghapus semua file .gz dan file log yang telah diputar..."
find /var/log -type f -regex ".*\.gz$" -exec rm -Rf {} +
find /var/log -type f -regex ".*\.[0-9]$" -exec rm -Rf {} +

# Menghapus file log tambahan seperti .1, .2, dan sebagainya
echo "Menghapus file log dengan ekstensi tambahan seperti .1, .2, dll..."
find /var/log -type f -regex ".*\.[0-9]+$" -exec rm -Rf {} +

# Membersihkan kernel lama
echo "Memeriksa dan menghapus kernel lama..."
dpkg-query -l | grep linux-im*
apt-get purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n -1) --assume-yes
echo "Memasang header kernel terbaru yang sesuai dengan kernel aktif..."
apt-get install linux-headers-`uname -r | cut -d'-' -f3`-`uname -r | cut -d'-' -f4`

# Membersihkan selesai
echo "Pembersihan selesai"
