# Linux

Linux is an open-source operating system kernel used by many operating systems (Linux distributions) such as Ubuntu, Debian, and CentOS. Most cloud servers run Linux because it is stable, secure, highly configurable, and well suited to automation.

---

## Why Linux is important in DevOps

Linux is central to DevOps because most production infrastructure runs on Linux. DevOps engineers use Linux to:

- Provision and manage servers (cloud VMs and bare metal)
- Deploy and run applications (often inside containers)
- Configure networking, permissions, and services
- Automate tasks with shell scripts and cron jobs
- Troubleshoot incidents using logs, processes, and system metrics
- Support CI/CD runners and build agents (commonly Linux-based)

---

## Common Linux commands used in DevOps

Below are commands I use regularly for navigation, file management, permissions, processes, networking, and troubleshooting.

### Navigation and file listing
- `pwd` — print current directory
- `ls` — list files and folders (`ls -la` shows hidden files and details)
- `cd` — change directory (`cd ..` up one level, `cd ~` home)

### Files and directories
- `mkdir` — create a directory (`mkdir -p path/to/folder`)
- `touch` — create an empty file
- `cp` — copy files/folders (`cp -r` for directories)
- `mv` — move/rename files/folders
- `rm` — remove files (`rm -r` for directories, `rm -rf` force delete)
- `find` — search for files (`find . -name "*.tf"`)
- `tree` — display folder structure (may need installing)

### Viewing and editing files
- `cat` — print file content
- `less` — view long files with scrolling
- `head` / `tail` — show start/end of files (`tail -f` follows logs)
- `nano` / `vim` — edit files in terminal

### Searching text (logs and configs)
- `grep` — search inside files (`grep -R "ERROR" .`)
- `awk` — extract/format columns from text output
- `sed` — find/replace text in streams/files

### Permissions and ownership
- `chmod` — change permissions (`chmod +x script.sh`)
- `chown` — change owner/group (`sudo chown user:group file`)
- `umask` — default permission settings

### Users and identity
- `whoami` — current user
- `id` — user/group IDs
- `sudo` — run commands as admin


### Networking and connectivity
- `ip a` — network interfaces and IPs
- `ping` — basic connectivity test
- `curl` — make HTTP requests (API checks)
- `wget` — download files
- `ss -tulpn` — listening ports and services
- `nslookup` / `dig` — DNS troubleshooting
- `traceroute` — network path analysis (may need installing)

### Services and logs (systemd)
- `systemctl status <service>` — service status
- `systemctl start|stop|restart <service>` — manage services
- `journalctl -u <service>` — view service logs
- `journalctl -f` — follow logs live

### Archives and packages
- `tar -czf` / `tar -xzf` — create/extract tar.gz archives
- `apt` — install packages on Debian/Ubuntu (`sudo apt install <pkg>`)
- `yum` / `dnf` — package managers on RHEL-based systems

### Environment variables
- `echo $VAR` — print a variable
- `export VAR=value` — set a variable for the session
- `env` / `printenv` — list environment variables

---
