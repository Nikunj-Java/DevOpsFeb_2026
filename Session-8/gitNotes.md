# Github Commands
## Initialised an Empty Repository
```
git init
```
## Check the list of files Available
```
ls -a
```
Note: You will see .git folder

## Add some Files in it
```
touch file.txt
```
## Check the list of files Available
```
ls
```
## Step: 1 Add file(s) to the Remote Repository
```
git add <file_name>
git add .
```
- . means adding all files
## Step:2 Check the Status
```
git status
```
Output:
```
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   file1.txt

```
- to remove file from stagging(remote Repo)
```
git rm --cached <filename>
```
output: rm 'file1.txt'

- check the status
```
git status
```
- output
```
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        file1.txt

```
## Step:3 Snapshot
```
git commit -m "First Commit"
```
check the logs of commits
```
git log
git log --oneline
```
## Append the data in the files
```
echo "This is File1" >> file1.txt
echo "This is File2" >> file2.txt
echo "This is File3" >> file3.txt
echo "This is File4" >> file4.txt
echo "This is File5" >> file5.txt
```
## Task
1. Add files to the Stagging
```
git add .
or 
git add <filenam.txt>
```
2. check the status after stagging
```
git status
```
3. Create Snapshot
```
git commit -m "Data Added to the Files"
```
4. Check the Logs
```
git log --oneline
git log
```
5. Append Few More Data and follow (1)-(4)
