echo "========================
      SYSTEM INFO
========================
Desktop processor:$(lscpu | grep 'Model name' | tail -c +34)
System Kernel:$(uname -r)
Operating system version:$(cat /etc/os-release | grep VERSION= | tail -c +9)
Desktop memory:
Serial number:
System IP:
-------------------------
Installed software:


=========================" > ~/system_info.txt