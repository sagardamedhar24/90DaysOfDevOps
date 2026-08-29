# Day 22 – Introduction to Git: Your First Repository
## Task 1: Install and Configure Git
1. Verify Git is installed on your machine
   * `git --version`
2. Set up your Git identity - name and email
   * `git config --global user.email "youremail@gmail.com"`
   * `git config --global user.name "username"`
3. Verify your configuration
   * `git config --global --list`

* **Output:**

  <img width="803" height="175" alt="image" src="https://github.com/user-attachments/assets/16a2c1a6-9e07-4a2d-9963-e29e680cf676" />

## Task 2: Create Your Git Project
1. Create a new folder called `devops-git-practice`
   * `mkdir devops-git-practice`
2. Initialize it as a Git repository
   * `git init`
3. Check the status - read and understand what Git is telling you
   * `git status`
   * The output shows, that currently I am on master branch, but there are no commits yet and does not have anything to commit.
4. Explore the hidden `.git/` directory - look at what's inside
   * `cd .git`
   * The hidden `.git` directory contains number of files and directories under it, where Git stores all version control history, configurations, and metadata for the repository.
* **Output:**

  <img width="709" height="466" alt="image" src="https://github.com/user-attachments/assets/06e1c933-1aaa-4fd6-bc19-974e71c944ef" />

## Task 3: Create Your Git Commands Reference
1. Create a file called git-commands.md inside the repo
   * `touch git-command.md`
2. Add the Git commands you've used so far, organized by category:
   * Setup & Config
   * Basic Workflow
   * Viewing Changes
3. For each command, write:
   * What it does (1 line)
   * An example of how to use it
* **Output:**
 
  <img width="676" height="130" alt="image" src="https://github.com/user-attachments/assets/badf6eda-df5c-4e4a-91f7-205bd4b49096" />

  <img width="964" height="493" alt="image" src="https://github.com/user-attachments/assets/e0d854d7-0ed4-40c0-aa21-2e553a7fcb9d" />

## Task 4: Stage and Commit
1. Stage your file
   * Git status before staging the file:

   <img width="599" height="140" alt="image" src="https://github.com/user-attachments/assets/d7dc9cce-fd39-4a10-8cbd-a9924052c854" />
     
   * Staging File: `git add git-command.md` 
2. Check what's staged
   * Git status after staging file:

   <img width="671" height="134" alt="image" src="https://github.com/user-attachments/assets/9c834090-8042-4d62-9514-6cff72840a04" />

3. Commit with a meaningful message
   * `git commit -m "Commiting Git Commands Markdown File"

   <img width="871" height="73" alt="image" src="https://github.com/user-attachments/assets/2cc8c3b5-7e26-4773-a950-2b44b5aa0037" />

4. View your commit history
   * `git log` : Default View with full details(SHA,author,date,message).
   * `git log --oneline` : This option shows one line per commit (Compact View).

   <img width="629" height="173" alt="image" src="https://github.com/user-attachments/assets/f2dddde0-e870-47bd-942f-20aab2dc432f" />

## Task 5: Make More Changes and Build History
1. Edit `git-commands.md` - add more commands as you discover them.
   * Added two command uses in `git-command.md` file
2. Check what changed since your last commit
   * Using `git status`, I noticed, it shows modified file status, with unstaged changes.

   <img width="653" height="143" alt="image" src="https://github.com/user-attachments/assets/9f1d0cf1-c771-462f-9138-5d0acc74bd1b" />

3. Stage and commit again with a different, descriptive message
   * `git add git-commands.md`
   * `git commit -m "Update git-commands.md file"`

   <img width="851" height="313" alt="image" src="https://github.com/user-attachments/assets/45f56403-a733-4374-8ae4-a54234827b44" />

4. Repeat this process at least 3 times so you have multiple commits in your history

   <img width="730" height="463" alt="image" src="https://github.com/user-attachments/assets/0f633691-4654-49d2-b1d5-68913c145b9b" />
   
5. View the full history in a compact format
   * `git log --oneline`
  
   <img width="634" height="132" alt="image" src="https://github.com/user-attachments/assets/a66204d0-cdac-4c6b-9e35-55f3525fd097" />

## Task 6: Understand the Git Workflow
1. What is the difference between git add and git commit?
   * `git add` - This command, help to add our untracked files/changes from local workspace to Staging area, before commiting them.
   * `git commit` - It will commit staged changes/files to Github Repository.
     
2. What does the staging area do? Why doesn't Git just commit directly?
   * Staging area act as a mediator or temporary loading dock between our local files and remote repository. If we add any local file into staging area
     and if wants to make changes then we can revert it, before commiting to remote repository, so that it does not create history in remote.
   * When we runs `git commit`, whatever changes we have in staging area, those gets parmanantely stored on remote git repository.
   * Staging area gives us a safty check before writing to a paramanent history. We can run `git diff -staged` to review the exact chnaged line up for final commit.
   * This also helps resolving merge conflicts by marking resolved files step-by-step before finalizing the merge content.
     
3. What information does git log show you?
   * `git log` shows us the detail view of commit history with SHA, author, Date and commit message.
     
4. What is the .git/ folder and what happens if you delete it?
   * `.git` is the github repository directory which is located at the root directory of the project, which gets created after running `git init` command.
     This hidden directory contains different files and sub-folders, which stores repository configurations, metadata, object databases and tracking history for the project.
     If we delete the `.git` directory, project files remain intact but all version control history, branches, and remote connections are parmanantely removed.

5. What is the difference between a working directory, staging area, and repository?
   * This three spaces represents the lifecycle stages of files in git and tracking changes from raw files to paramanent commit history.
   * **Working Directory:** Actual Working directory in our local system/file system, where we can create, edit or delete the fiels.
   * **Staging Area:** A single hidden folder `.git`ie. draft box, where we gather specific changes using `git add`. It is a preview zone, which help which changes are suppose to be in committed
     and in should in git history.
   * **Repository:** The `.git` directory Object database. The paramanent storage where git stores our committed files/changes remotely. Once committed, changes are paramanent in the git project history.
