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