# CPU Bottlenecks
- High CPU Usage
- Slow Applications
- High Load Average (uptime, top, htop to Monitor)

# How to Deal With It?
- Use 'ps' to list the CPU Consuming Process
- Example:
```
    ps
```
- Output
```
    PID TTY          TIME CMD
    643 pts/0    00:00:00 bash
   2075 pts/0    00:00:00 ps
```
- Example:
```
 ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -10
```
- also u can check using sysstat
## systat
```
sudo apt install sysstat
```
- Run:
```
mpstat -P ALL 1
```
- Solution:
```
Optimize the code , add caching, or Scale the Server Horizontally by adding More and More Servers
```

# Memory Bottlenecks
- system slowdown Frequent Swapping
- High RAM usage( you can check using 'free -m' or vmstat)
- Out of Memory (OOM Errors)
## How to Deal With IT ?
```
free -h             # it is used to check free memory usage

ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -10
```

# I/O Bottlenecks
- slow file read/ write operations
- High Disk Utilization
- High Network Latency or Dropped Packets

## How to Identify ?
- Monitor disk I/O
```
iostat
```
```
iostat -dx
```
```
iostat -dx -1
```
Output:
```
- %util -> disk usage(close to 100%= bad ,0.00%= Good)
- await -> latency
- inShort Disk is Overloaded
```
- To find the input and Output i/o Consuming Process
```
sudo iotop
```

# Introduction to SAR
(System Activity Report)
- it is command line tool that collect Report and Saves System Performance Data
- it is part of sysstat package
- it provides insight of CPU Usage , Memory Utilization , Network Activity

## How to Install ?
```
sudo apt update 
sudo apt install sysstat -y
```
## Enable and Start Data Collection
```
sudo systemctl enable sysstat
sudo systemctl start sysstat
```
- let's start collecting the data
```
sar -u 5 5
```
- Note
```
  u = CPU Usage Report
5 5 = Collects data every 5 seconds for 5 iterations
%user       = CPU rime spent on user process 
% System    = CPU time Spent on System / Kernel
% I/Owait   = Time Waiting for I/O Operations
%idle       = Available CPU Time
```

- Run
```
 sar -S 5 5
```
- Note:
```
 -S = Swap Usage Statistics
```

- Run

```
 sar -d 5 5
```
- Note:
```
 -d = Disk Memory
```
