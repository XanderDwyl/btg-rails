#!/bin/bash
echo ''

# Init message
echo $(date) '[ Git Hooks ] Symlinking commit hook scripts...'

# Check if file already symlinked
if [ -h .git/hooks/pre-commit ]; then
  echo $(date) '[ Git Hooks ] Commit hook scripts already symlinked'
else
  ln -s $(pwd)/script/pre-commit.sh .git/hooks/pre-commit
  echo $(date) '[ Git Hooks ] DONE!'
fi
