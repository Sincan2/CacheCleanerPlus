Berikut adalah README.md dengan nama repositori **CacheCleanerPlus.git** yang telah disesuaikan:

---

# Cache Cleaner Plus

### **Overview**
This repository contains two shell scripts designed to automate the cleaning and maintenance of a Linux system's disk space:
1. **`cleaner.sh`** - A script to clean unnecessary files, orphaned packages, and old kernels to free up disk space.
2. **`disk_cleaner.sh`** - A script to monitor disk usage and automatically trigger `cleaner.sh` if disk usage exceeds 80%. It also schedules weekly checks using `cron`.

---

### **Features**
- Monitors disk usage and runs cleaning automatically when usage exceeds 80%.
- Removes:
  - Unused cache files.
  - Orphaned packages.
  - Old log files, rotated logs, and `.gz` files.
  - Trash files from all users.
  - Old Linux kernels.
  - Unnecessary packages.
- Automatically schedules weekly disk checks and cleaning using `cron`.
- Easy to configure and extend.

---

### **Installation**
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Sincan2/CacheCleanerPlus.git
   cd CacheCleanerPlus
   ```

2. **Make Scripts Executable:**
   ```bash
   chmod +x disk_cleaner.sh cleaner.sh
   ```

3. **Run the Disk Monitoring Script:**
   ```bash
   ./disk_cleaner.sh
   ```
   - This will check the current disk usage and clean the system if usage exceeds 80%.
   - The script will also schedule weekly checks automatically.

---

### **Usage**
- To manually clean the system:
  ```bash
  ./cleaner.sh
  ```
- To monitor disk usage and trigger cleaning automatically:
  ```bash
  ./disk_cleaner.sh
  ```
- The `disk_cleaner.sh` script adds a `cron` job to check disk usage weekly. You can verify this by running:
  ```bash
  crontab -l
  ```
  The cron job will look like:
  ```
  @weekly /path/to/disk_cleaner.sh
  ```

---

### **Requirements**
- **Supported Linux Distributions:** Debian-based systems (e.g., Ubuntu).
- **Dependencies:**
  - `bash`
  - `deborphan` (will be installed automatically if not present).

---

### **Files**
| File              | Description                                                                 |
|-------------------|-----------------------------------------------------------------------------|
| `cleaner.sh`      | The core cleaning script. Removes unnecessary files, packages, and old logs. |
| `disk_cleaner.sh` | Monitors disk usage, triggers `cleaner.sh`, and schedules weekly checks.     |

---

### **Output Example**
When `disk_cleaner.sh` is run:
```plaintext
Memulai proses pemeriksaan disk dan pembersihan...
Penggunaan disk saat ini: 85%
Penggunaan disk melebihi 80%. Menjalankan pembersihan...
Memeriksa ruang yang digunakan oleh file cache di /var/cache/apt/archives...
Membersihkan semua file log di /var/log...
... (proses pembersihan lainnya) ...
Pembersihan selesai!
Pemeriksaan mingguan telah dijadwalkan dengan cron.
Selesai.
```

---

### **Contributing**
Feel free to submit issues, fork the repository, and open pull requests. Contributions are always welcome!

---

### **License**
This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute this software.

---

Let me know if you need further adjustments!
