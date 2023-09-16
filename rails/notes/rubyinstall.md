
```markdown
# Setting up rbenv and Installing Ruby on Rails

This guide outlines the steps to set up rbenv, install a specific version of Ruby (3.2.2), and then install Ruby on Rails.

## Step 1: Install rbenv

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc  # Add rbenv to bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc  # Initialize rbenv
source ~/.bashrc  # Reload bashrc
```

## Step 2: Install the `ruby-build` Plugin

```bash
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

## Step 3: Install Ruby 3.2.2

```bash
rbenv install 3.2.2
```

## Step 4: Set Ruby 3.2.2 as the Global Version

```bash
rbenv global 3.2.2
```

## Step 5: Install Ruby on Rails

```bash
gem install rails
```

## Step 6: Verify Rails Installation

```bash
rails -v
```

This should display the installed version of Ruby on Rails.

That's it! You've successfully set up rbenv, installed Ruby 3.2.2, and installed Ruby on Rails. You can now start using Rails for your development projects.
```

You can copy and paste this content into a `readme.md` file in your project's repository to document the setup process for future reference.
