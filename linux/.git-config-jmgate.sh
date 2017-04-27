# Set your username
git config --global user.name "Jason M. Gates"

# Set your email address
git config --global user.email jmgate@sandia.gov

# Use colorized output when it makes sense
git config --global color.ui true

# Push only the current tracking branch (upstream in newer git versions)
git config --global push.default tracking

# Enable rerere by default
git config --global rerere.enabled 1

# Select the diff tool
git config --global diff.tool kompare
git config --global difftool.prompt false

# Select the git editor
git config --global core.editor vim

# Rebase instead of merge with pull
git config --global pull.rebase true

# Git aliases
git config --global alias.co      'checkout'
git config --global alias.cob     'checkout -b'
git config --global alias.br      'branch'
git config --global alias.ci      'commit'
git config --global alias.st      'status'
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last    'log -1 HEAD'
git config --global alias.pl      'log --decorate --graph'
git config --global alias.pla     'log --decorate --graph --all'
git config --global alias.dt      'difftool --dir-diff'
git config --global alias.visual  '!gitk'
git config --global alias.discard 'checkout --'
git config --global alias.d1      '!git diff $1^ $1'
git config --global alias.cm      '!git add -A && git commit'
git config --global alias.save    '!git add -A && git commit -m "SAVEPOINT"'
git config --global alias.wip     'commit -am "WIP"'
git config --global alias.restore 'reset HEAD~1 --mixed'
git config --global alias.amend   'commit -a --amend'
#git config --global alias.wipe    '!git add -A && git commit -qm "WIPE SAVEPOINT" && git reset HEAD~1 --hard'
#git config --global alias.bclean  '!f() { git branch --merged ${1-develop} | grep -v " ${1-develop}$" | xargs -r git branch -d; }; f'
#git config --global alias.bdone   '!f() { git checkout ${1-develop} && git pull --rebase --prune && git bclean ${1-develop}; }; f'
