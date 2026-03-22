# Nice and Renice
- nice is used to start process with specific priority
- renice is used to change priority of exixting process
    1. each process has a nice value ranging from -20 (highest priority) to 19 (lowest priority)
    2. By Default new process starts with a nice value of 0.
## Check The Priority of the Process Running in WSL
- open the wsl
- run the command
```
    top
```
- this will gives you the Priority and Nice Value in The Column PR and NI
- higher the value menans lower the priority (i.e; Process is 'nice' to others)
- lower the value means higher the priority (i.e; requires root access for negative value)
- you can start a particular process by using priority as 
```
    nice -n 10 myscript.sh
```
## Hands on With Nice & Renice
## 1. Nice
- 1. Create 'myscript.sh'
```
#!/bin/bash
echo "Starting the Heavy Task...."

while true
# infinite loop to consume CPU
do
  echo "Processing..."
done
```
- 2. make it executable
```
chmod +x ./myscript.sh
```

- 3. Run with nice value
```
nice -n 10 ./myscript.sh
```
- 4. open the wsl and check PR and NI column of myscript.sh
```
top
```
## Conclusion
```
- Priority=10 (Lower Priority)
- CPU gives preference to other process
- System stays smoother
```
## 2. Renice
- renice = change the priority of a running process
- lets run the myscript.sh file
```
./myscript.sh
```
- open the terminal and search for the process
```
ps aux | grep myscript.sh
```
- example
```
nikunj     18218 99.9  0.0   4752  3072 pts/0    R+   08:42   0:19 /bin/bash ./myscript.sh
nikunj     18335  0.0  0.0   4096  1920 pts/2    S+   08:43   0:00 grep --color=auto myscript.sh
```
## Let's Change the Priority using Renice

```
renice -n 10 -p 18218
// note : 18218 is the process ID (You can get from 'top' as PID)
```

# Context Switching
- Context Switching : CPU Switching from one process/ thread to another
- Since CPU can run one process at a time(Per Once), it quicky switches between process to give the illusion of Multitasking
## What is "Context"?
- when CPU Pauses a process it must be save:
- CPU Register the current calculation, Memory State, Stack Information
- This Saved Data is Called As 'Context'
## Step By Step Explanation
## Step 1: Process 'A' is Running
```
./script.sh
```
- this will register A's Data
## Step 2: Process 'B' is Running
```
./myscript.sh
```
- this will register B's Data

## Step:3 Interrupt Happens
interrupts can be
- Time Slice Finished
- i/o request
- Higher Priority process arrived

## Step:4 Save Context of 'A
- OS saves :
    - 1. Registers
    - 2. Instruction Pointer
    - 3. Sate
## Step:5 Load Context of B
- OS Loads:
    - 1. B's Register
    - 2. B's Memory state

## Step:6  Process B runs
- CPU Start executing B