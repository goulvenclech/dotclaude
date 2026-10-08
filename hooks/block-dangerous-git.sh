#!/bin/bash
# Heredoc bodies are skipped. Other quoted text is matched line by line, so a
# quoted line that starts with a dangerous git command is denied too. Known gap:
# a command passed to a shell as text (sh -c "git push", a heredoc piped to sh).

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
[ -z "$COMMAND" ] && exit 0

FILTERED=$(echo "$COMMAND" | awk '
  inhd { t=$0; gsub(/^[[:space:]]+|[[:space:]]+$/, "", t); if (t == term) inhd=0; next }
  {
    l=$0; gsub(/<<</, "", l)
    if (match(l, /<<-?[[:space:]]*["'"'"']?[A-Za-z_][A-Za-z_0-9]*["'"'"']?/)) {
      term=substr(l, RSTART, RLENGTH); sub(/^<<-?[[:space:]]*/, "", term); gsub(/["'"'"']/, "", term); inhd=1
    }
    print
  }')

SQ="'"
SEG='("[^"]*"|'"$SQ"'[^'"$SQ"']*'"$SQ"'|\\ |[^[:space:]"'"$SQ"';&|])'
OPT='-'"$SEG"'+'
VAL='([^[:space:]"'"$SQ"';&|-]|"[^"]*"|'"$SQ"'[^'"$SQ"']*'"$SQ"')'"$SEG"'*'
ANCHOR='(^|[;&|({`]|\$\()'
WRAP='((if|elif|then|else|while|until|do|!|sudo|command|exec|eval|nohup|time|xargs|env|nice|timeout|[A-Za-z_][A-Za-z0-9_]*='"$SEG"'*)([[:space:]]+('"$OPT"'([[:space:]]+'"$VAL"')?|[0-9][0-9.smhd]*))*[[:space:]]+)*'
GITBIN='(\\|[^[:space:]]*/)?git'
GITOPT='([[:space:]]+((-C|-c|--git-dir|--work-tree|--namespace|--config-env|--exec-path|--super-prefix)[[:space:]]+'"$VAL"'|'"$OPT"'))*'
GIT="${ANCHOR}[[:space:]]*${WRAP}${GITBIN}${GITOPT}[[:space:]]+"
ARG='([[:space:]]+[^[:space:];&|]+)*[[:space:]]+'
F='(-[a-zA-Z]*f[a-zA-Z]*|--force)'
D='(-[a-zA-Z]*d[a-zA-Z]*|--delete)'
END='([[:space:]]|$|[;&|)`])'
PATTERNS=(
  "push${END}"
  "reset${ARG}--hard"
  "clean${ARG}${F}"
  "branch${ARG}(-[a-zA-Z]*D|-[a-zA-Z]*d[a-zA-Z]*f|-[a-zA-Z]*f[a-zA-Z]*d|${D}${ARG}${F}|${F}${ARG}${D})"
  "checkout${ARG}(\.\/?|:\/)${END}"
  "checkout${ARG}${F}"
  "restore${ARG}(\.\/?|:\/)${END}"
)

for p in "${PATTERNS[@]}"; do
  if echo "$FILTERED" | grep -qE "${GIT}${p}"; then
    jq -n --arg reason "Blocked by ~/.claude/hooks/block-dangerous-git.sh: the command matches the dangerous git pattern '$p'. The user runs these commands themselves." \
      '{hookSpecificOutput:{hookEventName:"PreToolUse",permissionDecision:"deny",permissionDecisionReason:$reason}}'
    exit 0
  fi
done
exit 0
