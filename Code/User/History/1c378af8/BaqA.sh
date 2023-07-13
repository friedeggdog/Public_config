echo "==============================
        COMPUTER LOG
==============================
Uptime:
$(uptime)

Disk and memory usage:
Disk:$(df -hl  --total | tail -n 1 | awk '{print $5}')
Mem:$(free | grep Mem | awk '{print $3/$2 * 100.0}')%

Utilization and most expensive processes:
CPU Usage: "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%
Most Expensive process:
$(ps aux | sort -rk 3,3 | head -n 2)

Open TCP ports:
$(ss | grep tcp)

Current connections:
$(netstat -natp)

Processes:
$(ps -ax)

=============================" > ~/comp_log.txt ##make sure script is executable