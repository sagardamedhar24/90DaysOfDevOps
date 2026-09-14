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
  * First main point is, rebase creates a new commit ID and rewrite the history, and if we do so after commits pushed and shared with other,
    they can face the sync issues as they have old commit ID/history and after rebase that got changed to new commit IDs.
  * Means for shared branches, we should avoid the rebase and instead use merge option, to avoid synchronization & non-fast-forward errors/issues.  
* When would you use rebase vs merge?
  * Rebase is good option, when our branch is private and no-one else is using it and we want to update our feature branch history with the latest changes from another branch without creating a merge commit
  * Rebase is not a good choice when it comes to shared branches.
  * Use merge, when we want to combine histories without rewriting existing commits and preserves the actual development history.
  * When branches are shared, Merge is a better option.

## Task 3: Squash Commit vs Merge Commit
