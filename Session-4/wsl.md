# 4. File permissions and Ownwership
- there are 3 Types of Users:
    ```
        User(Owner)
        Group
        Others
    ```
- There Are 3 Permissions
    1. Read         -r
    2. Write        -w
    3. Execute      -x
- if some file has ```-rwxr-xr--``` permission
    ## Meaning
        ```
            -    --> file
            rwx  --> owner
            r-x  --> group
            r--  --> others
        ```
# 5 chmod, chown ,umask
    1. chmod (change permission)
    ``` 
    chmod u+x script.sh
    ``` 
    Meaning
    ```
    u -> user
    g -> group
    o -> others
    ```
    Example
    ``` 
    chmod g+x file.txt
    ``` 