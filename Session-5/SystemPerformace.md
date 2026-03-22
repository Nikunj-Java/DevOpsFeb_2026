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

