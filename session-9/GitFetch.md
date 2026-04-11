# What is GitFetch?
- it download changes from remote repository (like Github) but doesn't change your working code.

## How to use Fetch ?
- 1. step-1 
```
git fetch
```
- 2. Git Connects to remote (origin)
    - it checks what chnges are available on remote branch.
- 3. Download new commits
    - new comiits are stored in your local branch(repo) , but in a separate area
 ## Example
```
origin /main (updated)
main (unchnages)
```

## Before Fetch:
```
Local Area: A---B
Remote Main: A---B---C---D
```

## After Git Fetch
Local Main: A---B
origin/ Main: A--B---C---D