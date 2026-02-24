#!/usr/bin/env bash
set -euo pipefail

# ==========================================
# AUTO GIT PRO SCRIPT
# ==========================================
# This script automates the full Git workflow:
#
# 1. Adds all changes
# 2. Creates a commit
# 3. Pulls latest changes (rebase)
# 4. Pushes to GitHub
# 5. Automatically sets upstream if missing
#
# Usage:
#   ./autogit.sh "commit message"
#   ./autogit.sh
#
# Options:
#   -f  Force push
#   -n  Dry run (test mode)
# ==========================================

FORCE=0
DRYRUN=0

while getopts ":fn" opt; do
  case "$opt" in
    f) FORCE=1 ;;
    n) DRYRUN=1 ;;
    *) echo "Usage: $0 [-f] [-n] [commit message]"
       exit 1 ;;
  esac
done
shift $((OPTIND-1))

run() {
  # Executes or prints command
  if [ "$DRYRUN" -eq 1 ]; then
    echo "[DRY RUN] $*"
  else
    eval "$@"
  fi
}

# Check if inside git repo
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "ERROR: Not a git repository"
  exit 1
fi

# Get current branch name
BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Get commit message
MSG="${1:-}"

if [ -z "$MSG" ]; then
  read -rp "Enter commit message: " MSG
fi

if [ -z "$MSG" ]; then
  echo "ERROR: Empty commit message"
  exit 1
fi

# Check for changes
if git status --porcelain | grep -q .; then

  echo "Adding files..."
  run "git add -A"

  echo "Creating commit..."
  run "git commit -m \"$MSG\""

else

  echo "No changes found"

fi


# Check if upstream exists
if git rev-parse --abbrev-ref --symbolic-full-name @{u} \
>/dev/null 2>&1; then

  echo "Upstream exists"

  echo "Pulling latest changes..."
  run "git pull --rebase"

  echo "Pushing..."

  if [ "$FORCE" -eq 1 ]; then
    run "git push --force-with-lease"
  else
    run "git push"
  fi

else

  echo "No upstream found"

  echo "Setting upstream and pushing..."

  run "git push -u origin $BRANCH"

fi

echo "================================"
echo "SUCCESS: Git updated"
echo "Branch: $BRANCH"
echo "================================"
