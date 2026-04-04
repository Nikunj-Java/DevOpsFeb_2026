# Git Branching & Merging
- as git is used for Colloborative Approch, we can create many Branches and individual Developers can Work Collaboratively
- as a result we can create multiple Branches as per the need
- example
```
master
main 
login
dashboard
feature
```
## Useful Commands
- 1. Get The List of Branches
```
git branch
``` 
- 2. Create a New Branch
```
git branch master
```
[note: this will create "Master" branch in Github Repo(Locally)]
[this will copy all the files and folder from the initial branch to newly created branch]
- 3. Switch between the Branches
```
git checkout <branch_name>
git switch <branch_name>
git checkout -b <branch_name>
git swicth -c <branch_name>
```
- 4. Create and Switch the Branch
```
git checkout -b feature
git swicth -c feature
```
- 5. Upload the Code with Branches
```
git push -u origin <name_of_branch>

```