#!/bin/bash

# ARCHITECTURE
arc=$(uname -a)

# PHYSICAL CPU
pcpu=$(grep "physical id" /proc/cpuinfo | wc -l)

# VIRTUAL CPU
vcpu=$(grep "processor" /proc/cpuinfo | wc -l)

# RAM
ram_total=$(free -m | awk '$1 == "Mem:" {print $2}')
ram_used=$(free -m | awk '$1 == "Mem:" {print $3}')
ram_rate=$(free -m | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')

# DISK
disk_total=$(df -Bg | grep '^/dev/' | grep -v '/boot$' | awk '{dt += $2} END {print dt}')
disk_used=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{du += $3} END {print du}')
disk_rate=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{du += $3} {dt+= $2} END {printf("%d"), du/dt*100}')

# CPU LOAD
cpu_usage=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}')

# LAST BOOT
last_boot=$(who -b | awk '$1 == "system" {print $3 " " $4}')

# LVM USE
lvmu=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)

# TCP CONNECTIONS
ctcp=$(ss -ta | grep ESTAB | wc -l)

# USER LOG
ulog=$(users | wc -w)

# NETWORK
ip=$(hostname -I)
mac=$(ip link | grep "link/ether" | awk '{print $2}')

# SUDO
cmds=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

wall "
		#Architecture: $arc
    	#CPU physical: $pcpu
	    #vCPU: $vcpu
	    #Memory Usage: $ram_used/${ram_total}MB ($ram_rate%)
	    #Disk Usage: $disk_used/${disk_total}Gb ($disk_rate%)
	    #CPU load: $cpu_usage
	    #Last boot: $last_boot
	    #LVM use: $lvmu
	    #Connections TCP: $ctcp ESTABLISHED
	    #User log: $ulog
	    #Network: IP $ip ($mac)
	    #Sudo: $cmds cmd
	"

