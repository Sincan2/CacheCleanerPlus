# CacheCleanerPlus

[![License](https://img.shields.io/github/license/Sincan2/CacheCleanerPlus?style=flat-square)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/Sincan2/CacheCleanerPlus?style=social)](https://github.com/Sincan2/CacheCleanerPlus/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/Sincan2/CacheCleanerPlus?style=social)](https://github.com/Sincan2/CacheCleanerPlus/network)

## About the Project
**CacheCleanerPlus** is a shell script designed to help optimize and free up disk space on Ubuntu systems by clearing cached files, cleaning up logs, and removing unnecessary packages. This script is especially useful for maintaining system performance, particularly on systems with limited storage.

## Getting Started

To get started with **CacheCleanerPlus**, clone the repository and run the script as described below.

### Prerequisites
Make sure you have superuser privileges, as this script requires access to system directories and package management.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Sincan2/CacheCleanerPlus.git
   ```
2. Navigate into the project directory:
   ```bash
   cd CacheCleanerPlus
   ```
3. Run the script with superuser privileges:
   ```bash
   sudo ./cleaner.sh
   ```

## Usage

The script performs various cleaning tasks to free up disk space:
- Checks disk space used by cached files.
- Empties all log files in `/var/log`.
- Removes partial, orphaned, and unnecessary packages.
- Clears the Trash and obsolete kernel files.

Example command:
```bash
sudo ./cleaner.sh
```

### Features

- Frees up space by clearing package caches and logs.
- Removes old kernels and unnecessary packages.
- Deletes rotated log files (e.g., `.1`, `.2`, `.gz`).
- Clears user and root Trash directories.

## Contributing

Contributions are welcome! To contribute:
1. Fork the project.
2. Create a new branch (`git checkout -b feature/FeatureName`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/FeatureName`).
5. Open a Pull Request.

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Project Link: [https://github.com/Sincan2/CacheCleanerPlus](https://github.com/Sincan2/CacheCleanerPlus)

---

Dengan nama *CacheCleanerPlus*, README ini memberikan panduan langsung untuk menggunakan dan memahami proyek Anda.
