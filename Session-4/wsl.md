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
        
            -    --> file
            rwx  --> owner
            r-x  --> group
            r--  --> others
        
# 5 chmod, chown , umask
    1. chmod (change permission)
    
    chmod u+x script.sh
 
    Meaning
    
    u -> user
    g -> group
    o -> others
    
    Example
     
    chmod g+x file.txt
## Numerical Method
Permission Values
```
r = 4
w = 2
x = 1

```
Example-1 
```
    chmod 755 script.sh
```
Meaning
```
7  = rwx
5  = r-x
5  = r-x

```
Example 2
```
    chmod 777 script.sh
```
Meaning
```
7  = rwx
7  = rwx
7  = rwx

```

Example 3
```
    chmod 666 script.sh
```
Meaning
```
6  = rw
6  = rw
6  = rw

```
## 2.chowm (Change Ownership)
Change Owner
```
    sudo chown jhon file.txt
```
Change Owner Group
```
    sudo chown jhon:developer file.txt
```

## 3. umask (Default Permissions)
Defines Default Permission for new files.
1. check values
```
    umask
```
2. Example Output
```
    022
```
3. Default Permission
```
    666 - 022 = 644
    meaning
    6 = r-w
    4 = r
    4 = r
```
4. Default Directory Permission
```
    777 - 022 = 755
    meaning
    7 = rwx
    5 = rx
    5 = rx
```