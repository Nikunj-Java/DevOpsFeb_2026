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
- %util -> disk usage(close to 100%= bad)
- await -> latency
```