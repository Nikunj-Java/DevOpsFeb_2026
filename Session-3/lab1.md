# Basic Linux Terminal Exercises

Below are practical exercises to help you get comfortable with basic Linux commands. Complete these in the terminal of an Amazon Linux 2023 machine.

---

## Exercise 1: Who Are You & Where Are You?
1. Log in to your Amazon Linux machine using SSH.
2. Find out which user you are logged in as.
3. Print your current working directory.

---

## Exercise 2: Exploring the Filesystem
1. List the contents of the `/tmp`, `/home`, `/usr`, and `/var` directories.
2. List the contents of your home directory.
3. List all files (including hidden ones) in your home directory.

---

## Exercise 3: Getting Help
1. Use the manual (`man`) command to read about the `ls` and `cp` commands.
2. Find out what the `-l`, `-a`, and `-h` options do for the `ls` command.

---

## Exercise 4: Creating Directories
1. Create a directory called `practice` in your home directory.
2. Inside `practice`, create a nested directory structure: `steve/nick/frank` (all in one command).
3. List the contents of `practice` recursively to verify the structure.

---

## Tips
- All commands are lowercase.
- Pay attention to spaces between commands, options, and arguments.
- Use `man <command>` for help on any command.

---

## Answers

### Exercise 1: Who Are You & Where Are You?

**Question 2:** Find out which user you are logged in as.
```bash
whoami
```
**Explanation:** The `whoami` command prints the username of the current user. On Amazon Linux 2023, this is typically `ec2-user`.

**Question 3:** Print your current working directory.
```bash
pwd
```
**Explanation:** The `pwd` (print working directory) command displays the full path of your current location in the filesystem.

---

### Exercise 2: Exploring the Filesystem

**Question 1:** List the contents of the `/tmp`, `/home`, `/usr`, and `/var` directories.
```bash
ls /tmp
ls /home
ls /usr
ls /var
```
**Explanation:** The `ls` command lists directory contents. These are important system directories: `/tmp` for temporary files, `/home` for user home directories, `/usr` for user programs, and `/var` for variable data like logs.

**Question 2:** List the contents of your home directory.
```bash
ls ~
```
**Explanation:** The tilde `~` is a shortcut that represents your home directory (typically `/home/ec2-user`).

**Question 3:** List all files (including hidden ones) in your home directory.
```bash
ls -a ~
```
**Explanation:** The `-a` flag shows all files, including hidden files (those starting with a dot `.`).

---

### Exercise 3: Getting Help

**Question 1:** Use the manual command to read about the `ls` and `cp` commands.
```bash
man ls
man cp
```
**Explanation:** The `man` command displays the manual page for a command. Press `q` to quit, use arrow keys or space to navigate, and `/` to search within the manual.

**Question 2:** Find out what the `-l`, `-a`, and `-h` options do for the `ls` command.
```bash
man ls
```
**Explanation:** Reading the manual reveals:
- `-l` uses long listing format (shows permissions, owner, size, date, etc.)
- `-a` shows all files including hidden ones
- `-h` prints sizes in human-readable format (e.g., 1K, 234M, 2G)

---

### Exercise 4: Creating Directories

**Question 1:** Create a directory called `practice` in your home directory.
```bash
mkdir ~/practice
```
**Explanation:** The `mkdir` command creates a new directory.

**Question 2:** Inside `practice`, create a nested directory structure: `steve/nick/frank` (all in one command).
```bash
mkdir -p ~/practice/steve/nick/frank
```
**Explanation:** The `-p` flag creates parent directories as needed. Without it, you'd get an error if the parent directories don't exist.

**Question 3:** List the contents of `practice` recursively to verify the structure.
```bash
ls -R ~/practice
```
**Explanation:** The `-R` flag lists directories recursively, showing all subdirectories and their contents.

---

### Exercise 6: Changing Directories

**Question 1:** Change to the following locations using absolute path.
```bash
cd /usr/bin
cd /usr/local/bin
cd /var/log
```
**Explanation:** Absolute paths start with `/` and specify the complete path from the root directory. They work from any location in the filesystem.

**Question 2:** Change to the following locations using relative paths, starting from `/var/log`.
```bash
# Starting from /var/log
cd ../../etc/rc.d
cd ../../usr/share
cd ../lib
```
**Explanation:** Relative paths depend on your current location. `..` means parent directory. From `/var/log`:
- `../../etc/rc.d` goes up two levels to `/`, then into `etc/rc.d`
- `../../usr/share` goes up two levels to `/`, then into `usr/share`
- `../lib` goes up one level to `/usr`, then into `lib`

---
