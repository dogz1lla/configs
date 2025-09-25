#!/bin/zsh


DIRS_LIST=(
    "$HOME/code"
)

SESSION_NAME=$(find "${DIRS_LIST[@]}" -type d -depth 2 -print \
    | sed "s@$HOME@@" \
    | grep -E --invert-match "\.(git|github|clj-kondo|lsp|cpcache)$" \
    | fzf)

# prepend the HOME back
PROJECT_DIR="$HOME$SESSION_NAME"

if ! tmux has-session -t "$SESSION_NAME"; then
    # session not found -> create
    tmux new-session -d -c $PROJECT_DIR -s $SESSION_NAME
fi
tmux switch-client -t $SESSION_NAME
