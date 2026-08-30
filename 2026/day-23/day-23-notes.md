# Day 23 – Git Branching & Working with GitHub
## Task 1: Understanding Branches
1. What is a branch in Git?
   * A branch in git is a different workspace or a lightweight movable pointer to a specific commit.
   * It is a separate copy of the main code/development line, where we can build fixes, and bugs without affecting main code workspace.
2. Why do we use branches instead of committing everything to main?
   * By using branches, it is very helpful to test our developed code/feature successfully before merging to main branch.
   * This avoids the issues or bugs in the main project workspace, by creating separate branches for each and every feature.
3. What is HEAD in Git?
   * In Git, HEAD is a location where pointer is currently targeting. It tells Git, exactly which branch we are currently working on and
    which commit is act as the parent for your next change.
4. What happens to your files when you switch branches?
   * When we switch branches, Git safely rewires the project directory by changing, adding, or deleting files to match the exact state of the branch, we are switching on.
   * If a file present on both branches but has different code, Git overrides the file in your directly to match the target branch.
   * If the target branch has a new files, that does not exist on current branch, Gits immediatly creats them.
   * If your current branch has files that does not exists on target branch, Git safely hides or removes them from your folder. These are not deleted from git history,
     they just won't appear on your workspace while your are on a new branch.

## Task 2: Branching Commands — Hands-On
1. List all branches in your repo
   * `git branch` or `git branch -a`
2. Create a new branch called `feature-1`
   * `git branch feature-1` 
3. Switch to `feature-1`
   * `git switch feature-1`
   * Output:

     <img width="680" height="179" alt="image" src="https://github.com/user-attachments/assets/60a6891a-0b24-44bd-9a1a-bcb368712aea" />

4. Create a new branch and switch to it in a single command — call it `feature-2`
   * `git checkout -b feature-2`
   * Output:

     <img width="732" height="212" alt="image" src="https://github.com/user-attachments/assets/8f2701c0-4180-4f93-9ff9-43467e5b0d91" />

5. Try using `git switch` to move between branches — how is it different from `git checkout`?
   * `git checkout` : This is a multi-purpose utility. It switches branches, creates branches, checks out individual commits, and overwrite working tree files.
   * `git switch`: It is a single-purpose tool. It only switches or cretes branches. IT can not modify or overwrites individual files.
   * `git switch` is Safe against accidental file overwrites. With `git checkout`, a typo between a branch name and a file name could overwrite your local work without warning.
   * Output:

   <img width="695" height="169" alt="image" src="https://github.com/user-attachments/assets/456d974d-7797-4d4a-b714-dba09b7d659d" />

6. Make a commit on `feature-1` that does not exist on `main/master`
   * `git switch feature-1`
   * `git add git-commands.md`
   * `git commit -m "Added git branch specific commands in git-commands.md file"`
   * `git log master..feature-1 --oneline` - See commits on feature that are not on master branch.
   * Output:
    
   <img width="954" height="355" alt="image" src="https://github.com/user-attachments/assets/81ec64df-368f-40ba-8e17-b7840c8dbc41" />

   <img width="943" height="92" alt="image" src="https://github.com/user-attachments/assets/a1b4cf2b-30a5-4748-a060-be5a8ad9357d" />
    
7. Switch back to `main/master` — verify that the commit from `feature-1` is not there
   * `git switch master` - Switched to master branch
   * `git log feature-1..master --oneline` - See commits on main that are not on feature branch.
   * Checked the file `git-commands.md` after switching on master branch and does not find changes here that I made on feature-1 branch.
   * Below Snapshot shows that, branch feature-1 showing one extra commit. (`2f2b7c1 (HEAD -> feature-1) Added git branch specific commands in git-commands.md file`)

   <img width="679" height="211" alt="image" src="https://github.com/user-attachments/assets/7a51f52f-fae7-4ec5-bc94-1a44f962c2a9" />

8. Delete a branch you no longer need
   * `git branch -d feature-2` - Delete a branch safely.
   * `git branch -D feature-2` - Delete a branch forcefully, if you want and it having some conflicts or giving some error.
   * Output:
  
   <img width="668" height="171" alt="image" src="https://github.com/user-attachments/assets/597ba354-0078-4f46-bcd1-937a5851863a" />

11. Add all branching commands to your git-commands.md
    * Added all git branch commands in `git-commands.md` file commited in feature-1 branch.

    <img width="948" height="470" alt="image" src="https://github.com/user-attachments/assets/43bdb9bd-b414-49e7-a5c8-3652b0b4e468" />

## Task 3: Push to GitHub
1. Create a new repository on GitHub (do NOT initialize it with a README)
   * Created a new repository on GitHub with name: `devops-git-practice`
   * Repo Link: https://github.com/sagardamedhar24/devops-git-practice
     
2. Connect your local `devops-git-practice` repo to the GitHub remote
   * Connected my EC2 instance `devops-git-practice` repo to the GitHub remote repository `devops-git-practice` using `git remote add origin` command.
   * `git remote add origin git@github.com:sagardamedhar24/devops-git-practice.git`
   * Output:
    
    <img width="946" height="143" alt="image" src="https://github.com/user-attachments/assets/2b8cc127-91e6-4625-b409-d3ce3873580b" />

3. Push your `main/master` branch to GitHub
   * Push local `master` branch on GitHub: `git push origin master`
   * GitHub Repo Snapshot:

   <img width="698" height="308" alt="image" src="https://github.com/user-attachments/assets/7666e2dd-6a6d-4fdf-acd0-adea1b5907a6" />

4. Push `feature-1` branch to GitHub
   * Push local `feature-1` branch to GitHub: `git push origin feature-1`

     <img width="683" height="457" alt="image" src="https://github.com/user-attachments/assets/58971e87-d81c-4c22-ab42-e81f5b78d9ab" />

5. Verify both branches are visible on GitHub
   * GitHub Repo Pushed Branches Snapshot:

   <img width="925" height="368" alt="image" src="https://github.com/user-attachments/assets/775ca739-5e39-4500-a26c-8dba3644a4a2" />

   <img width="716" height="320" alt="image" src="https://github.com/user-attachments/assets/ca8a20cc-f5cd-480d-96ff-458dbd9410b9" />

6. Answer in your notes: What is the difference between origin and upstream?
   * **Origin:** It is points to the self owned remote repository and having full read and write access to it, as we are the owner for it.
   * **Upstream:** This points to the remote repository owned by someone else, that we forked on our local repo. Usually having read-only access.

## Task 4: Pull from GitHub
1. Make a change to a file directly on GitHub (use the GitHub editor)
   * Made some addition into `git-commands.md` file on GitHub directly and commited them, on `feature-1` branch 
2. Pull that change to your local repo
   * Pulled changes from GitHub repo->`feature-` branch to local repo.
   * `git pull origin feature-1`
   * Output:

    <img width="675" height="329" alt="image" src="https://github.com/user-attachments/assets/cc84444a-f69b-49eb-9b99-83e5c0febdf2" />

3. Answer in your notes: What is the difference between git fetch and git pull?
   * `git fetch`: It only download changes from remote repo to local repo without altering local repo working files. It is safe, as it does not make any changes to currently working directory.
   * `git pull`: This command download the remote data and immediately merge it into your current local branch. It directly updates the working files to match the remote version.

## Task 5: Clone vs Fork
1. Clone any public repository from GitHub to your local machine
   * I have cloned shell-script repo (https://github.com/LondheShubham153/shell-scripts) from GitHub to EC2. 
   * Command: `git clone git@github.com:LondheShubham153/shell-scripts.git`

   <img width="754" height="199" alt="image" src="https://github.com/user-attachments/assets/a5ad032c-45e3-4d3d-9076-1f6e86652f4e" />

2. Fork the same repository on GitHub, then clone your fork
   * I have forked the same repo (shell-script) on GitHub.
   * And, when I tried to clone it my forked repository, I got an error: 'fatal: destination path 'shell-scripts' already exists and is not an empty directory.'

   <img width="488" height="337" alt="image" src="https://github.com/user-attachments/assets/3e731ff4-0629-444c-94f1-b63e327b227e" />

    <img width="730" height="28" alt="image" src="https://github.com/user-attachments/assets/84af1f8f-3c06-406f-ad0b-5120d1e6fc82" />

3. Answer in your notes:
   * What is the difference between clone and fork?
     * `clone`: `Clone` means copying the remote repository to our local system and is connected to the remote. If we do not have write access to that repo, we can not push any changes to it. This can be used in Git.
     * `fork`: `Fork` is copy of the remote GitHub repo owned by someone into our personal GitHub account. The forked copy lives on a server and it is now completely independed repo, that we own and can manage.
       This is used on GitHub and not Git.
   * When would you clone vs fork?
     * If I want to own and manage everything of any remote repo from GitHub on server level, then I will fork that repo in my GitHub Account.
     * If I just wanted copy of remote repo onto my local system, just for some reference.
   * After forking, how do you keep your fork in sync with the original repo?
     * On web UI, we can sync-up the fork with the Original repo by using `Sync fork` button on that repo.

       <img width="674" height="146" alt="image" src="https://github.com/user-attachments/assets/39cbf161-9dd7-41b6-9690-3622be2c5361" />
 
     * And, on command line/terminal we can sync the fork with original repo using command `git fetch upstream`.
