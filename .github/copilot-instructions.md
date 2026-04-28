Copilot instructions — raisinbl/.dotfiles

Purpose

Short, repo-specific guidance so Copilot sessions understand how this repository is organized and which commands are relevant.

1) Build / test / lint commands

- This repository is a collection of user dotfiles; there are no repo-level build/test/lint suites.
- Useful commands to manage and apply repository state:
  - Update submodules (run after pulling or when a branch adds submodules):

    git submodule update --init --recursive

  - Manage this repo as the user's $HOME (alias defined in home_config/.aliases):

    alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

    Use: dotfiles status | dotfiles add <file> | dotfiles commit -m "msg" | dotfiles push

  - Vim plugin install (vim-plug):

    vim +PlugInstall +qall

    or (headless/neovim):

    nvim --headless +PlugInstall +qall

- Single-test guidance: no test harness exists in this repo; there is no "run single test" command.

2) High-level architecture (big picture)

- The repository root contains a home_config/ directory that mirrors the user's $HOME layout. Edit configs under home_config (e.g. home_config/.vim/vimrc), not live files in ~ when preparing changes in the repo.
- Third-party tools/themes/plugins are vendored using git submodules (see .gitmodules). Common submodules: oh-my-zsh, powerlevel10k, alacritty themes, password-store (private), zsh plugins.
- Generated/plugin-managed folders such as home_config/.vim/plugged are ignored in .gitignore and are not meant to be committed.
- ~/.gitconfig is present and uses gh as a credential helper; the gh CLI integration is expected.

3) Key conventions and repository-specific patterns

- Source-of-truth: home_config/ contains the dotfile sources that map to $HOME. When adding or changing config files, modify home_config/ paths.
- Submodules: when adding external plugins/themes, add them as git submodules under home_config and commit the .gitmodules change.
- Do NOT commit plugin-managed or generated directories (e.g. home_config/.vim/plugged). .gitignore lists these.
- Secrets: home_config/.password-store is a submodule; treat it as private—do not expose secrets.
- Vim plugins: repo uses vim-plug in home_config/.vim/vimrc. To add a plugin: add Plug 'owner/repo' to that file and run PlugInstall.
- zsh/oh-my-zsh: oh-my-zsh is a submodule at home_config/.oh-my-zsh; prefer updating the submodule rather than editing vendored core files.

4) Copilot / editor integrations found in repo (useful for context-aware suggestions)

- home_config/.vim/vimrc includes Plug 'github/copilot.vim' and maps <C-L> to accept the next Copilot completion: imap <C-L> <Plug>(copilot-accept-word)
- home_config/.ideavimrc maps <C-l> to copilot.applyInlaysNextWord for IdeaVim.
- home_config/.aliases defines two convenient GH CLI aliases for Copilot:

    alias ghcs='gh copilot suggest'
    alias ghce='gh copilot explain'

- Because Copilot is used in both Vim and via the gh CLI, suggestions may be accepted via <C-L> in Vim/IdeaVim or via the gh copilot extension.

5) Important files to read for context

- README.md (contains basic git workflow notes and the submodule reminder)
- .gitmodules (shows vendored submodules)
- home_config/.aliases (defines the dotfiles git alias)
- home_config/.vim/vimrc and home_config/.ideavimrc (editor integrations and keymaps)
- .gitignore (which generated/plugin directories to avoid committing)

6) README excerpt (retain these exact commands where relevant)

```bash
# getting changes
git pull

# merge
git merge <update_branch>

# ... resolve conficts

# done
git merge --continue # just like a commit
```

If you've added submodule on updated branch

```bash
git submodule update --init --recursive
```

Notes

- Avoid making changes to vendored submodule code in-place; update the submodule or its upstream instead.
- Do not commit files that are intentionally ignored (see .gitignore).

If you want the Copilot instructions adjusted (more examples, more file pointers, or automation steps for installing configs), say which area to expand.
