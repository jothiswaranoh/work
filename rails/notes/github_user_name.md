
# Managing Multiple GitHub Accounts (Personal & Office)

This guide helps you configure and switch between your personal and office GitHub accounts on the same machine.

## 1. Setting Up SSH Keys

First, generate and configure SSH keys for your personal and office GitHub accounts.

### Generating SSH Keys

For your **personal** account:

```bash
ssh-keygen -t rsa -b 4096 -C "your_personal_email@example.com" -f ~/.ssh/id_rsa_js
```

For your **office** account:

```bash
ssh-keygen -t rsa -b 4096 -C "your_office_email@example.com" -f ~/.ssh/id_rsa_office
```

### Adding SSH Keys to the SSH Agent

Add your SSH keys to the SSH agent:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa_js
ssh-add ~/.ssh/id_rsa_office
```

### Adding SSH Keys to GitHub

Copy the contents of the public keys to your GitHub accounts:

```bash
cat ~/.ssh/id_rsa_js.pub
cat ~/.ssh/id_rsa_office.pub
```

Then, add these keys to your respective GitHub accounts under **Settings > SSH and GPG keys**.

## 2. Configuring SSH

Set up your `~/.ssh/config` file to manage multiple GitHub accounts:

```plaintext
# Personal GitHub Account
Host github-personal
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa_js

# Office GitHub Account
Host github-office
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa_office
```

## 3. Cloning Repositories

When cloning repositories, use the appropriate SSH configuration:

- **Personal Projects**:
  ```bash
  git clone git@github-personal:your-personal-username/repo.git
  ```

- **Office Projects**:
  ```bash
  git clone git@github-office:your-office-username/repo.git
  ```

## 4. Configuring Git for Each Repository

Set the Git username and email for each repository to ensure commits are attributed correctly:

- **Personal Projects**:
  ```bash
  cd ~/path/to/personal/repo
  git config user.name "Your Personal Name"
  git config user.email "your_personal_email@example.com"
  ```

- **Office Projects**:
  ```bash
  cd ~/path/to/office/repo
  git config user.name "Your Office Name"
  git config user.email "your_office_email@example.com"
  ```

## 5. Switching Between Projects

Simply navigate to the project directory and Git will automatically use the correct configuration:

- **For Office Project**:
  ```bash
  cd ~/workspace/office/
  # Git commands here will use the office SSH key
  git pull origin main
  git push origin your-branch
  ```

- **For Personal Project**:
  ```bash
  cd ~/workspace/personal_project
  # Git commands here will use the personal SSH key
  git pull origin main
  git push origin your-branch
  ```

## 6. Troubleshooting

If you're prompted for credentials (username/password), it might be due to an old credential being cached. Clear the cache:

- **On macOS**:
  ```bash
  git credential-osxkeychain erase
  ```

- **On Linux or Windows**, you may need to manually remove the cached credentials.
