#!/bin/bash

# File cleaner.sh untuk membersihkan sistem
CLEANER_SCRIPT="cleaner.sh"

# Fungsi untuk memeriksa penggunaan disk
check_disk_usage() {
    USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
    echo "Penggunaan disk saat ini: $USAGE%"
    if [ "$USAGE" -ge 80 ]; then
        echo "Penggunaan disk melebihi 80%. Menjalankan pembersihan..."
        if [ -f "$CLEANER_SCRIPT" ]; then
            bash "$CLEANER_SCRIPT"
            echo "Pembersihan selesai!"
        else
            echo "File $CLEANER_SCRIPT tidak ditemukan. Pastikan skrip pembersih tersedia."
        fi
    else
        echo "Penggunaan disk masih di bawah 80%. Tidak ada tindakan yang diperlukan."
    fi
}

# Menjadwalkan pemeriksaan disk secara berkala dengan cron
schedule_weekly_check() {
    CRON_JOB="@weekly $(pwd)/$0"
    # Mengecek apakah cron job sudah ada
    if ! crontab -l | grep -Fxq "$CRON_JOB"; then
        (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
        echo "Pemeriksaan mingguan telah dijadwalkan dengan cron."
    else
        echo "Pemeriksaan mingguan sudah dijadwalkan."
    fi
}

# Memulai proses
echo "Memulai proses pemeriksaan disk dan pembersihan..."
check_disk_usage
schedule_weekly_check
echo "Selesai."
