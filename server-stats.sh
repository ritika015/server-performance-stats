
echo "===Server Performance Stats ==="

#CPU Usage
echo -e"\n CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: "100-$8"%"}'

#Memory Usage
echo -e"\n Memory Usage:"
free -m | awk 'NR==2{printf "Used: %s MB / %s MB (%.2f%%)\n", $3, $2, $3*100/$2}'

#Disk Usage
echo -e"\n Disk Usage:"
df -h --total | awk 'END {print "Used: " $3 " / " $2 " (" $5 " Used)"}'

#Top 5 CPU Processes
echo -e"\n Top 5 CPU Processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
