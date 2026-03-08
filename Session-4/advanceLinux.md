# What is Chron Job?
- a chron job is used to schedule tasks automatically in Linux
    1. Dailt backup
    2. cleaning log files
    3. Running script every hour
    4. sending automated reports
- in short it is periodically automated task
1. Open WSL
2. Open Editor
```
chrontab -e

```
3. Write the Below Command to it
```

* * * * * date >> time.txt
```
4. Run the file
```
 cat time.txt
```

5. Output
```
Sun Mar  8 08:19:01 UTC 2026
```
6. Meaning
```
    * * * * *   = runs every minute
    date        = prints current date and time
    >> time.txt = save it in a file
```
# Debugging CPU and Memory
in Production servers sometime:
- CPU becomes 100%
- Memory Becomes full
- Application becomes slow
To Monitor this Linux Tools are Available 
## check CPU Usage
```
    top
```
## Understanding 'top' output
```
line1: uptime Information
line2: Task Information
line3: CPU Usage Information
line4: Memory Usage Informtaion
```
Keywords used in top
```
    %us: user process
    %sy: system process
    %ni: nice priority process
    %id: idle time
    %wo: waiting time for I/O

```
## to kill ant running process the command is
Step:1
```
press : K
```

Step:2
```
enter the PID(Process ID)
```
Step:3
```
Enter
```

# htop: Interactive Process Viewer
## how to install?
for windows
```
sudo apt install htop -y
```
for mac
```
brew install htop
```

## useful htop commands
```
press f3: serach a process
press f9: to kill the process
press f6: to sort by different metrics
press q : to exit
to run htop: htop
```

## Example:1 
1. start htop
2. search(Press F3) for htop
3. Hit Enter
4. Kill the process (F9)
5. Hit Enter

## Example:2 start any program and kill using top | htop

# Free- Memory Usage Monitoring
- it will provide a quick overview of sytem memory usage
## How To Run?
```
free -h
```
## Understanding the output
```
total           : total memory available
used            : RAM currently in use
free            : Completely Free Memory available
shared          : Memory Shared Between The Process
buff/cache      : Memory used for bufferes and cache
available       : RAM available for new process
```

## some of the important commands
display the value in MB
```
free -m
```

display the value in GB
```
free -g
```
continuosly monitoring memory usage(Update on every One Seconds)
```
watch -n 1 free -h
```

# Summary
1. top: for a quick overview of CPU / Memory usage
2. htop: for an interactive user friendly process monitor as same as top but with colors
3. free: to check the memory available as a glance

# Exporting information to a file
Step:1 open wsl

Step:2 Run the Command
```
top -b -n 1 > /mnt/c/Users/your_username/Desktop/my_top_output.txt

```

# Significance of Load Average
```
uptime
```
1. ideal load
    -if load is <= to no.of CPU Core -> system is running smooth
    -ex: on 4-core CPU average load of 3.0 is considered to be fine
2. Overloaded System
    -if load exceeds  CPU core for a long periods , performance degrades.
    -ex. on 4 core CPU a load of 8.0 means CPU is Overloaded

# Context Switching
- context switching occurs when the CPU switches from One Process to another
- Context switching is the mechanism by which the Linux kernel saves the current state context of a running process or thread and loads the saved state of another process to be run. 
- This process makes it possible for multiple tasks to share a single CPU and provides the illusion of parallel execution in a multitasking environment.

## how to check context switching in linux?
```
sudo apt install vmstat
sudo apt install sysstat
```
1. context switch per second (look at cs)
```
vmstat 1 5
```
2. show number of context switch over time
```
sar -w 1 5
```
3. display the context switching since boot
```
cat /proc/stat | grep ctxt
```

# Summary
1. Find a process: 
```
ps
```
2. Find a process with details: 
```
ps aux
```
3. Find a specific process with details: 
```
ps aux | grep process_name
```
4. Find a specific process with details: 
```
ps aux | grep top
ps aux | grep htop
ps aux | grep bash
```