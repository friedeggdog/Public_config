echo "==============================
        COMPUTER LOG
==============================
Uptime:
$(uptime)

Disk and memory usage:
$(df -hl  --total | tail -n 1 | awk '{print $5}')
$(free | grep Mem | awk '{print $3/$2 * 100.0}')

Utilization and most expensive processes:


Open TCP ports:


Current connections:


Processes:

=============================" > comp_log.txt