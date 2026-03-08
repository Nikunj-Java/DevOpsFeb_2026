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