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
git config --global alias.co      checkout
git config --global alias.br      branch
git config --global alias.ci      commit
git config --global alias.st      status
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last    'log -1 HEAD'
git config --global alias.plogall 'log --decorate --graph --all'
git config --global alias.plog    'log --decorate --graph'
git config --global alias.dt      'difftool --dir-diff'
git config --global alias.visual  '!gitk'
git config --global alias.undo    'reset HEAD~'
git config --global alias.discard 'checkout --'
