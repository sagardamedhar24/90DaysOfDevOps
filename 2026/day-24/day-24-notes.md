# Day 24 – Advanced Git: Merge, Rebase, Stash & Cherry Pick
## Task 1: Git Merge — Hands-On
1. Create a new branch `feature-login` from `master`, add a couple of commits to it.
   * Created a new branch `feature-login` from master: `git checkout -b feature-login`
   * Added `hello.py` file and committed it.
   * Written additional function in the same file and committed it.
     
  <img width="763" height="413" alt="image" src="https://github.com/user-attachments/assets/18037c79-30c4-47c4-9c71-9bbf7daac9fa" />

  <img width="734" height="287" alt="image" src="https://github.com/user-attachments/assets/b3d0babe-32b1-4c36-bede-f3db15246765" />

2. Switch back to `master` and merge `feature-login` into `master`
   * Switched to `master` and merged `feature-login` into it.
   * Switch between branches: `git switch master` or `git checkout master`
   * Merge `feature-login` : `git merge feature-login`

  <img width="743" height="336" alt="image" src="https://github.com/user-attachments/assets/5c860ef4-c68c-43f0-89a7-663bc2f43b8f" />

3. Observe the merge — did Git do a fast-forward merge or a merge commit?
   * Git performed a **fast-forward** merge and not a merge commit, because the target branche is not moved forward or changed after creating feature branch.
4. Now create another branch `feature-signup`, add commits to it — but also add a commit to `master` before merging
   * Created branch `feature-signup` : `git checkout -b feature-signup`
   * Added new file and commted it on same branch.
   * Added commit on master branch as well.
   <img width="709" height="302" alt="image" src="https://github.com/user-attachments/assets/5238f2c4-a97d-4807-a555-41b90ee16104" />

   <img width="591" height="23" alt="image" src="https://github.com/user-attachments/assets/cc099930-089f-4923-bbfd-4ab17a7205b6" />

   <img width="683" height="224" alt="image" src="https://github.com/user-attachments/assets/850f3872-45df-492e-85d8-d92bac651677" />

5. Merge `feature-signup` into `master` — what happens this time?
   * Merged `feature-signup` into `master`: `git merge feature-signup`
   * This time when performed merge, git did **merge commit**, because there are already changes committed on `master` branch after creating `feature-signup` branch, before merging `feature-signup` branch.
   
   <img width="956" height="506" alt="image" src="https://github.com/user-attachments/assets/23e38db7-804b-4d67-a7aa-d4b902bc0d2a" />

   <img width="617" height="267" alt="image" src="https://github.com/user-attachments/assets/43c93515-c106-4378-9d1a-fde044faf26e" />

6. Points to Remember:
* What is a fast-forward merge?
  * A fast-forward merge occurs in a Git, when a target branch does not have any new commits and has not moved forward after creating a feature branch.
  * During this merge, Git simply moves the branch pointer to the latest commit.
  * This does not create a merge commit.
* When does Git create a merge commit instead?
  * It is a special commit, when two branches are diverged, and both contains a unique commit history.
  * Generates a brand-new "merge commit" node that ties the two separate branch histories together.
  * It is happens automatically, while merging when both branches have unique commits that diverged from one another.
* What is a merge conflict? (try creating one intentionally by editing the same line in both branches)
  * A merge conflict happens when same line of code/lines in the same file are modified on both branches.
  * Git does not automatically determine, which lines are supposed to be kept.
  * This conflict needs to be manually resolved before merging and then merge the changes.

<img width="788" height="468" alt="image" src="https://github.com/user-attachments/assets/28437f7b-3325-4098-a9f5-0127fa53485d" />

## Task 2: Git Rebase — Hands-On
1. Create a branch `feature-dashboard` from main, add 2-3 commits
   * Created branch `feature-dashboard` : `git checkout -b feature-dashboard`
   * Added few commits on it.

  <img width="854" height="460" alt="image" src="https://github.com/user-attachments/assets/f2ae28b3-9987-483a-8888-aa69496de172" />

2. While on `main`, add a new commit (so main moves ahead)
   * Added new commits on `master` branch.
     
   <img width="795" height="469" alt="image" src="https://github.com/user-attachments/assets/5e88d1f0-ec11-4646-b6f0-09220b34663c" />

3. Switch to feature-dashboard and rebase it onto main
   * Switched to feature-dashboard and rebased it with master: `git rebase master`
   
   <img width="643" height="288" alt="image" src="https://github.com/user-attachments/assets/23ea1d4b-d8b0-4862-91a9-be99200d0583" />

4. Observe your `git log --oneline --graph --all` — how does the history look compared to a merge?
   * As per the logs, after rebase and before rebase of `feature-dashboard` branch, first thing I noticed, hash codes are changed for the commits from feature-dashboard.
   * Seeing `feature-dashboard` branch commits on top of `master` commits, after rebase.
   * No new merge commit is created, just commit history has been rewritten.
   * Showing sequential and linear history.

<img width="722" height="379" alt="image" src="https://github.com/user-attachments/assets/77801859-d100-452f-adce-d06c06ba55ec" />

5. Points to Remember:
* What does rebase actually do to your commits?
  * Rebase moves/reapply the commits from one branch on top of another branch
  * When Git rebases commits, it generally creates new commits i.e. new commit ID (hashcode) gets generated but with the same commit message like olde.
  * It creates linear and clear commit history, unlike merge.
* How is the history different from a merge?
  * Since, merge created non-linear history, but rebase has linear history.
  * Does not generated new commit ID in merge for existing commits but created one new Merge Commit with different ID.
  * Merge, preserves actual commit history but rebase has re-written it.
* Why should you never rebase commits that have been pushed and shared with others?
  * The first main point is that rebase creates a new commit ID and rewrite the history, and if we do so after commits are pushed and shared with others, they can face sync issues as they have the old commit ID/history, and after rebase that has changed to new commit IDs.
  * For shared branches, we should avoid rebase and instead use the merge option to avoid synchronization & non-fast-forward errors/issues.  
* When would you use rebase vs merge?
  * Rebase is a good option when our branch is private, and no one else is using it, and we want to update our feature branch history with the latest changes from another branch without creating a merge commit
  * Rebase is not a good choice when it comes to shared branches.
  * Use merge when we want to combine histories without rewriting existing commits and preserve the actual development history.
  * When branches are shared, Merge is a better option.

## Task 3: Squash Commit vs Merge Commit
1. Create a branch `feature-profile`, add 4-5 small commits (typo fix, formatting, etc.)
   * Created a branch `feature-profile` and added 3 commits into it.
  
    <img width="673" height="108" alt="image" src="https://github.com/user-attachments/assets/335c8cb1-8504-438b-b54c-85937e797438" />

    <img width="732" height="461" alt="image" src="https://github.com/user-attachments/assets/568c2235-3f91-4b4a-8760-eb4073bbcccc" />

2. Merge `feature-profile` into `main` using `--squash` — what happens?
   * Switched to `main` branch and merged `feature-profile into it using `--squash` merge.
   * `git merge --squash feature-profile`

  <img width="749" height="122" alt="image" src="https://github.com/user-attachments/assets/f8ff497e-1d47-4427-a75a-68d1baf1c9dc" />

3. Check git log — how many commits were added to main?
   * After performing the `--squash` merge, I did not find a commit about that merge in the logs.
   * Then, after checking the status of the `master` branch using `git status`, I noticed Changes to be committed.
   * That means that after a squash merge, a new commit is not created automatically, so I have to commit it manually.
   * And only one commit was added.

<img width="785" height="443" alt="image" src="https://github.com/user-attachments/assets/b48f7a9c-3ec6-4189-8483-3faa376ebe0f" />

4. Now create another branch `feature-settings` and add a few commits.
   * Created a new branch `feature-settings` from the `master` branch and added a few commits to it.

<img width="766" height="409" alt="image" src="https://github.com/user-attachments/assets/d6a86c97-a83c-4394-97a0-9489eed2687c" />

5. Merge it into main without --squash (regular merge) — compare the history
   * Merged the `feature-settings` branch into the `master` branch without a squash merge: `git merge feature-settings`
   * And after comparing the `squash` and regular merge, I found the following points:
   * Regular merge created a fast-forward merge commit by preserving all commit history. At the same time, squash created a single commit.
   * Squash merge does not create a new commit automatically; it just prepares changes in the working tree/index.

   <img width="644" height="212" alt="image" src="https://github.com/user-attachments/assets/bcc94cbd-050e-419d-81ce-6255812b167c" />

6. Points to Remember:
* What does squash merging do?
  * Squash merge does not create a merge commit automatically, and it only prepares changes in our working tree.
  * And it does combine the multiple small commits into a single one, and that also need not be performed automatically.
* When would you use squash merge vs regular merge?
  * **Squash Merge:**
  * When our feature branch has many small and messy commits.
  * When we want to keep our master branch commit history clean and easy to read.
  * **Regular Merge:**
  * If you want to preserve complete commit history.
  * When individual commits are important and meaningful.
  * If multiple users are working on shared branches.
* What is the trade-off of squashing?
  * We get a cleaner main-branch history by using squash if we have many small commits.
  * Reverting the entire feature can be simple.

## Task 4: Git Stash — Hands-On
1. Start making changes to a file but do not commit.
   * Made some changes in `hello.py` on the `feature-profile` branch, without committing the changes.

<img width="664" height="143" alt="image" src="https://github.com/user-attachments/assets/4877ad3c-87cb-49fd-9c22-545d9e65e5af" />

2. Now imagine you need to urgently switch to another branch — try switching. What happens?
   * Now, tried to switching on different branch but got the error as per the snapshot.
   * It does not allow me to make the changes.

   <img width="600" height="66" alt="image" src="https://github.com/user-attachments/assets/af84b140-a30c-460d-bf3b-2690a6d296fc" />

3. Use git stash to save your work-in-progress.
   * Used `git stash` to save my current work to the stash.

<img width="603" height="203" alt="image" src="https://github.com/user-attachments/assets/2eca1084-8411-435c-a3c2-20e30b34d8e6" />

4. Switch to another branch, do some work, and switch back
   * Switched to the `master` branch successfully after stashing my changes. Did checked some logs and git status.

<img width="596" height="451" alt="image" src="https://github.com/user-attachments/assets/06f3a139-6f03-429a-9b93-835a03e0c496" />

5. Apply your stashed changes using git stash pop
   * Applied stashed changes using `git stash pop` and verified the changes.
     
<img width="485" height="131" alt="image" src="https://github.com/user-attachments/assets/210589a5-e4e8-4cf3-93ce-93b80bb024de" />

6. Try stashing multiple times and list all stashes.
   * I made multiple changes in different files and stashed my changes.
   * Stashed using default options `git stash`, which saves our work by default with the last commit message.
   * Stashed using customer option `git stash -m "message"`, which saves our work in progress with a custom message.
   * Listed all stashes using `git stash list`

  <img width="663" height="431" alt="image" src="https://github.com/user-attachments/assets/cc813b16-d424-45d3-8d50-34e10b2b4394" />

7. Try applying a specific stash from the list. 
   * Applied a specific stash from the list by referring to the stash identifier.
   * e.g. `git stash apply stash@{1}`, `git stash apply stash@{2}`, etc. 

<img width="663" height="431" alt="image" src="https://github.com/user-attachments/assets/f043d08e-0836-456e-8228-20c370a95f77" />

8. Points to Remember:
* What is the difference between `git stash pop` and `git stash apply`?
  * `git stash pop`: This option restores the stash using the LIFO (Last In, First Out) rule, one by one. This restores only one stash at a time.
  * `git stash apply`: If we have some stash changes in the list and we want to pick/restore a specific stash by using a stash identifier, this can be used effectively.
* When would you use stash in a real-world workflow?

## Task 5: Cherry Picking
