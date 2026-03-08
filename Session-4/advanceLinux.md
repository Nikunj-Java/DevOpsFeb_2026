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
