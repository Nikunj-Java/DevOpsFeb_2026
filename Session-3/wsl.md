# 1. What is WSl
- WSl is Window Subsytem for Linux
# 2. How to Install in Windows?
- Open CMD ( Windows + R ) : type: cmd
- run: wsl --install
- username & password(it will not be visible)
# Important
- if this will give you anykind of error, Then Restart Your Machine, Goto> Boot Manager(F11 or F12), and Enable Virtualization on your System and Start The Same Processs Again

# Basic Linux Directories
```
- 1. Root Director
    command: /
    output: -bash: /: Is a directory
- 2. User Home Directories
    command: /home

- 3. Configuration files
    command: /etc
   
- 4. Logs and Variable data
    command: /var

- 5. Essential Commands
    command: /bin

- 6. User Programs
    command: /usr

- 7. Temporary Files
    commands: /tmp
```

# Basic Commands
- 1. Print Working Directory
``` 
    pwd
``` 
    - output: /home/nikunj
- 2. Clear the Terminal
```
    clear
```
- 3. check the username
```
    whoami
```
    - output(username): <your_username>
- 4. get the list of files
```
    ls
```
- 5. Long Format Files
```
    ls -l
```

- 6. Show Hidden Files and Folder
```
    ls -a
```

- 7. Human Redable Format
```
    ls -lh
```
- 6. color code in linux
```
    1. RED: Zip or Compressed Files
    2. GREEN: file
    3. BLUE: folders
```
- 7. cd (Changing Directory)
```
    cd
```
    - Examples
    ```
         cd documents
         cd foldername 
    ```
- 8. Move Back in Linux
```
    cd ..
```

- 9. Go to Home Directory
```
    cd ~
```
- 10. Create Directories
```
    mkdir project1
    or
    mkdir project2 project3 project4
```
- 11. Creating Files
```
    touch file.txt
```
- 12. Copy Files
```
    cp file.txt backup.txt
```
- 13. copy Directory
```
    cp -r folder1 folder2
```
- 14. Move
```
    mv old.txt new.txt

    or

    mv file.txt /home/nikunj/documents
```
- 15. Remove (Delete)
```
    rm file.txt
```

- 16. Delete Directory
```
    rm -r folder
```

- 17. Force Delete
```
    rm -rf folder
```