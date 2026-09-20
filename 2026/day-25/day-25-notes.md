# Day 25 – Git Reset vs Revert & Branching Strategies
## Task 1: Git Reset — Hands-On
1. Make 3 commits in your practice repo (commit A, B, C)
   * I have created a new branch `feature-reset-revert` and added 3 commits to it, to understand the git reset usage.

  <img width="872" height="379" alt="image" src="https://github.com/user-attachments/assets/fbba5ad8-480c-4946-871b-507d700e2933" />

2. Use `git reset --soft` to go back one commit — what happens to the changes?
   * Command used: `git reset --soft HEAD~1` 
   * Commit C is removed from commit history. 
   * Changes from Commit C are not removed and preserved in staging area.
   * Changes are ready for commit.

   <img width="725" height="195" alt="image" src="https://github.com/user-attachments/assets/7868c875-00be-435a-a391-58c2b29dcf3b" />

3. Re-commit, then use `git reset --mixed` to go back one commit — what happens now?
   * Re-commited changes from Commit C and used `git reset --mixed HEAD~1`
   * Commit C is removed from commit history.
   * Also, changes from commit C, are now kept in the unstaged area and not fully removed.
   * Now, before commit it again, we need to add it in staging area as well.
   * Important point is, this is the default behaviour of `git reset`

  <img width="877" height="411" alt="image" src="https://github.com/user-attachments/assets/571890ab-b3da-446f-bd15-c9decd13bc61" />

4. Re-commit, then use `git reset --hard` to go back one commit — what happens this time?
   * Re-commited changes for commit c and used `git reset --hard HEAD~1`
   * This time Commit C is removed from commit history along with the changes as well.
   * Changes are completely removed from working directory as well.
   * And, working tree is pointing to Commit B now and became clean.

  <img width="746" height="316" alt="image" src="https://github.com/user-attachments/assets/4f831b90-0e6e-4424-be22-225b9dcfa896" />

5. Points to Remember:
* What is the difference between --soft, --mixed, and --hard?
  * `git reset --soft` : This removes the commit from commit history and keep changes in Staged area. We can commit them again.
  * `git reset --mixed` : This removes the commit from commit history and keep (preseverd) changes in Unstaged area. We need to add it to stage and then commit, if want to commit again.
  * `git reset --hard` : This discard the changes completely along with commit from commit history. And, working tree became clean.

| RESET_MODE | Commit Removed | Changes Kept | Staged or not? |
| ---------- | -------------- | ------------ | -------------- |
| `--soft` | Yes | Yes | Yes |
| `--mixed` | Yes | Yes | No |
| `--hard` | Yes | NO | NO |

* Which one is destructive and why?
  * Hard reset is destructive, because it discard the changes along with commit history. Which may cause an issue if the branches are shared. 
* When would you use each one?
  * **Soft Reset:** When we want to remove the commit history and keep the changes in staging area.
  * **Mixed Reset:** When we want to undo the commit from commit history and changes want to review before commiting again.
  * **Hard Reset:** If we want to discard the unwanted changes completely from working tree and commit history as well. But, this suppose to be use very rare.
  
* Should you ever use git reset on commits that are already pushed?
  * No.
  * This is not a good practice, because the changes that are already pushed, there might be a possibility that on those chnages might be other team members are working.

## Task 2: Git Revert — Hands-On
1. Make 3 commits (commit X, Y, Z)
   * Added 3 commits on branch `feature-reset-revert`, to understand how the `git revert` works.
  
   <img width="643" height="90" alt="image" src="https://github.com/user-attachments/assets/fabcfa92-a322-4074-b822-f94e5c7d6e52" />
  
2. Revert commit Y (the middle one) — what happens?
   * Command : `git revert commit_id`
   * I have attempted to revert the Commit Y, but git found merge confilct.
   * This is because, there was already a Commit Z, on top of Commit Y.

<img width="533" height="347" alt="image" src="https://github.com/user-attachments/assets/2f2ea9c5-a234-4147-9a97-0c544c0be420" />

   * Resolved conflict manually and removed changes from commit Y.

<img width="877" height="474" alt="image" src="https://github.com/user-attachments/assets/6144f80e-1269-4814-81e2-34e302631c3d" />

3. Check git log — is commit Y still in the history?
   * Yes. Commit Y is still in the commit history.
   * But, git created a new commit that added as per the fixing the revert commit Y.
     
4. Points to Remember:
* How is git revert different from git reset?
  * `git revert` has preserved the commit history and also created new commit entry in the log. Whereas git reset' discards the commit history.
* Why is revert considered safer than reset for shared branches?
  * Because revert preserves the commit history.
  * It does not rewrite or remove the existing commits.
* When would you use revert vs reset?
  * **Git Revert:** Best suited for shared branches. When we want to undo the changes from a specific commit while preserving the commit history.
  * **Git Reset:** Only when I am working on private branches before merging changes with a shared branch. When we want to undo the changes from a specific commit and also want to remove the commit history.
 
  ## Task 3: Reset vs Revert — Summary

    | Point | `git reset` | `git revert` |
    | ----- | ----------- | ------------ |
    | What it does | Moves pointer the earlier commit | Create new commit node, for revert changes |
    | Removes commit from history | Yes | NO |
    | Safe for shared/pushed branches | NO | Yes |
    | When to use | Clearing the local commits before pushing | Undoing changes that are pushed |

## Assignment:
**`git reflog`**: `git reflog` is the most useful Git command for recovering lost commits.
* It records where `HEAD` and branch references have pointed in your local repository.
* Suppose we lost two commits by the wrong use of `git reset --hard`, but Git's reflog remembers that `HEAD` previously pointed to those commits.
* The `git reflog` shows all commits, including those we lost, along with their hash code. PFB snapshot.
* So, if we wanted to recover the previous state, then using `git reset --hard hash_id/commit_id` we can do that.

<img width="839" height="310" alt="image" src="https://github.com/user-attachments/assets/45fb153c-a854-45af-89c3-4508041ffb58" />


## Task 4: Branching Strategies
* Research the following branching strategies and document each in your notes with:
  * How it works (short description)
  * A simple diagram or flow (text-based is fine)
  * When/where it's used
  * Pros and cons

1. **GitFlow:** 

   **How it Works**
   * GitFlow is a Git Branching model that organizes development using different types of branches for features, releases, and hotfixes (bug fixes).
   * Normally, GitFlow has a `main` branch for production-ready code.
   * The `develop/development` branch contains the code that is going to be prepared for the next release. Developers create different `feature` branches from this develop branch.
   * When the work is done from `development`, and everything is ready for next release, the `release` branches are come into the picture.
   * `release` branches are typically used for final testing, version updates, documentation, and release preparation.
   * If there are any critical bugs are being found in production, then a `hotfix` branch is there for fix the bug and merge it under `main`.

   **Flow/Diagram**
   ```
   main
   |___ develop
   |     |_____ feature/signup
   |     |_____ feature/login
   |     |_____ Releases/v1.2
   |     |
   |____hotfix/v1.2.1
  
   ```

   <img width="1400" height="788" alt="1_MsVN9FOK7Aaue2gFYsehIg" src="https://github.com/user-attachments/assets/6ef210a7-aa21-4fc0-9086-a53c719b612d" />

  **When to Use**
  * GitFlow is mainly used in large projects where multiple developers works and has structural release process.
  * Project with scheduled releases.
  * Production applications where multiple times hotfix is required.

  **Pros:**
  * Clear and clean sepration of Production, development and release code.
  * Parallel Development: Multiple developers can work different features without affecting `main`
  * Critical production issues can be fixed independently without breaking into `main` code, using `hotfix` branch.
  * Good for scheduled releases.
  * Easy to understand the branch structure in large teams, where clear responsibilities established.

  **Cons:**
  * More branches means to more things to manage and understand.
  * More complex workflows as we have number of branches for different purposes, so developers need to understand which branch to use when.
  * Higher merge overhead, since more branches needs to merge.

2. **GitHub Flow:**

   **How it Works**
   * GitHub Flow is a lightweight Git branching workflow designed around small, frequent changes and continuous delivery/deployment.
   * Unlike Gitflow, it doesn't require separate `develop`, `release`, or `hotfix` branches
   * The flow starts from the `main` branch, and developers create feature branches from `main`.
   * Make changes on feature branches and, after pushing, create a pull request (PR) for merging them into `main`.
   * Once the reviewer reviews the changes and approves them, they will merge them into `main`.

   **Flow/Diagram**
   ```
     main
       |--- feature/login -------|
       |--- feature/signup ------|--- create PR --> Review PR --> Merge main
       |--- feature/dashboard ---|
   ```

   **When/Where to use:**
   * GitHub Flow works particularly well when a team uses continuous deployment.
   * Has a Web application or SaaS product.
   * Want a simple branching model.

   **PROS:**
   * It has a simple and easy workflow.
   * Mainly `main` and short-lived feature/bug-fix branches.
   * Excellent for CI/CD.
   * Pull Requests provide a place for discussion and review.
   * Since no permanent develop/release branches are required, this helps to reduce merge overhead.

   **Cons:**
   * Less suitable for scheduled releases.
   * Requires strong CI/CD, i.e. requires automated tests, due to frequent merging into `main`.
   * Requires good PR discipline. Poor reviews and rushed merging can introduce bugs into the code.
     
3. **Trunk-Based Development:**

   **How it works?**
   * It is a Git branching strategy where developers integrate their changes into a single `main` branch, called the 'trunk', very frequently.
   * Keep branches short-lived.
   * Instead of having long-lived branches like Gitflow, developers create very short-lived branches.
   * Make a small change, run automated tests.
   * Merge the change quickly and deploy it through CI/CD.

   **Flow/Diagram**
   ```
     main (trunk)
       |
     Create a small branch
       |
     code
       |
     Run Tests
       |
     Pull requests
       |
     Review + CI/CD
       |
     main/trunk
       |
     Deploy.
   ```
   
   **When/Where to Use?**
   * Trunk-Based Development works particularly well for teams practicing:
   * Continuous Integration
   * Continuous Delivery/Deployment
   * Automated testing
   * Small incremental changes

   **Pros:**
   * Fewer merge conflicts, because developers integrate frequently.
   * Fast Feedback: Code gets tested against the latest code quickly.
   * Easier Integration: Since we don't have huge feature branches containing weeks of changes.
   * Excellent for CI/CD.
   * Less Branch management.

   **Cons:**
   * Requires good automated testing.
   * Developers need to make small, incremental changes rather than huge changes.
   * Large features require additional techniques like Feature flags, modular design, or other techniques.
   * Can be difficult for inexperienced teams.

**Comparison**

| Points | Gitflow | GitHub Flow | Trunk-Based |
| ------ | ------- | ----------- | ----------- |
| Main Idea | Structured releases | PR-based development | Continuous integration |
| Best For | Scheduled releases | Frequent PR-based delivery | Frequent integration/deployment |
| Long-lived branches | Often | Usually No | No |
| Short-lived branches | Yes | Yes | Yes |
| CI/CD Friendly | Good | Excellent | Excellent |
| Complexity | High | Low | Low |

4. Answers to Questions:
* Which strategy would you use for a startup shipping fast?
  * I would generally choose Trunk-Based Development, often combined with Pull Requests + CI/CD + feature flags.
    
* Which strategy would you use for a large team with scheduled releases?
  * For a large team with scheduled, versioned releases, Gitflow is generally the better fit because it provides explicit branches for development, release stabilization, and production fixes.
    
* Which one does your favorite open-source project use? (Check any repo on GitHub)
  * A GitHub Flow
  * Commonly used by many open-source projects on GitHub.
  * The best example is 'Microsoft Projects', which is based on a PR-based workflow with short-lived branches.

## Task 5: Git Commands Reference Update
  [Git Command Reference](https://github.com/sagardamedhar24/devops-git-practice/blob/master/git-commands.md)


  
