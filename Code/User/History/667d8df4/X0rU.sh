echo "========================
      SYSTEM INFO
========================
Desktop processor:$(scpu | grep 'Model name' | tail -c +34)
System Kernel:$(uname -r)
Operating system version:
Desktop memory:
Serial number:
System IP:
-------------------------
Installed software:


=========================" > ~/system_info.txt