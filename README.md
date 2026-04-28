https://wiki.archlinux.org/title/Dotfiles

## Workflow

This repository serves as the **source of truth** for Arch Linux dotfiles and system configuration. The intended workflow is:

1. **On current device**: Update config files in `home_config/` directory, then commit and push to remote
2. **On new device**: 
   - Clone this repo: `git clone https://github.com/raisinbl/.dotfiles.git ~/.dotfiles`
   - Initialize submodules: `git submodule update --init --recursive`
   - Install system packages (via separate arch repo or pacman)
   - Symlink configs: `stow home_config` (from the repo root)

## Managing Changes

After making changes to config files, commits are already pushed on remote:

```bash
# getting changes
git pull

# merge
git merge <update_branch>

# ... resolve conficts

# done
git merge --continue # just like a commit
```

> [!NOTE] Optional
> If you've added submodule on updated branch <br>
> `git submodule update --init --recursive` to get these submodules on local

## Using Stow

Stow symlinks all files in `home_config/` to your `$HOME`, preserving the directory structure:

```bash
cd ~/.dotfiles
stow home_config
```

This creates symlinks like `~/.vimrc -> ~/.dotfiles/home_config/.vimrc`, so updates to the repo automatically reflect in your live config.