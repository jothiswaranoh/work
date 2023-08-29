Certainly, here's a simplified README file with commands and brief explanations for your actions:

```markdown
# Project Repository README

## Resolving Merge Conflicts and Pushing Branch LM-28-D

### Step 1: Stash Local Changes
```bash
git stash
```
- Stash any local changes to save them for later.

### Step 2: Switch to Main Branch and Update
```bash
git checkout main
git pull upstream main
```
- Switch to the 'main' branch.
- Pull the latest changes from the 'main' branch.

### Step 3: Create a New Branch
```bash
git checkout -b LM-28-D
```
- Create a new branch named 'LM-28-D' based on 'main'.

### Step 4: Apply Stash
```bash
git stash apply
```
- Apply the stashed changes, which may cause merge conflicts.

### Step 5: Resolve Merge Conflicts
- Manually edit conflicted files to resolve merge conflicts.

### Step 6: Stage Resolved Changes
```bash
git add <file1> <file2> ...
```
- Stage the resolved changes for commit.

### Step 7: Commit Changes
```bash
git commit -m "LM-28 solved datapicker and facet filter issue in plus and minus"
```
- Commit the changes with a meaningful message.

### Step 8: Push to Remote Repository
```bash
git push origin LM-28-D
```
- Push the 'LM-28-D' branch to the remote repository.

For more detailed explanations and context, please refer to the complete documentation or project history.

```

This README provides a high-level overview of the steps you've taken to resolve merge conflicts and push the 'LM-28-D' branch. You can include this in your project repository for quick reference by your team members.
