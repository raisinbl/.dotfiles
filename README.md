https://wiki.archlinux.org/title/Dotfiles

> [!NOTE]
> The following steps provides a way to see how to manage dotfiles with `git`.

After making change, commits are already push on remote

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