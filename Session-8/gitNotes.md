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
## Global User Config
- goto> www.github.com> signup
- note down your email and created New UserId 
- using registered email amd Username Configure the same in Your Local Repo
```
git config --global user.name "your github username"
git config --global user.email "your github email"
```
- To check the details
```
git config --list
git config user.name
git config user.email
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

## Step:4 Create Github Repository
- goto> www.github.com>new repository>Create
```
echo "# DevOps_test" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Nikunj-Java/DevOps_test.git
git push -u origin main
```
- copy the branch command(generally 4th command)
- copy the origin command (generally 5th command)
- copy the push command
- after using push command it will ask for Authentication
- add username and password to the browser for Authentication
- once Authentication is successfull, Data will be added to github
- open Your Repository in Github and Refresh
