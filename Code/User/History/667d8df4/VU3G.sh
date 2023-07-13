echo "========================
      SYSTEM INFO
========================
Desktop processor:$(lscpu | grep 'Model name' | tail -c +34)
System Kernel:$(uname -r)
Operating system version:$(cat /etc/os-release | grep VERSION= | tail -c +9)
Desktop memory:$(grep MemTotal /proc/meminfo | tail -c +18)
Serial number:$(sudo dmidecode -s system-serial-number)
System IP:$(hostname -i)
-------------------------
Installed software:
$(apt list --installed 2</dev/null)

=========================" > ~/system_info.txt ##make sure script is executable