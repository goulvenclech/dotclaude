#!/bin/bash
HOOK="$(cd "$(dirname "$0")" && pwd)/ledger-budget.sh"
export HOME
HOME=$(mktemp -d)
trap 'rm -rf "$HOME"' EXIT
DIR="$HOME/.claude/investigations/p"
mkdir -p "$DIR/attachments"
fail=0
rep() { printf "$1%.0s" $(seq "$2"); }
ledger() {
  local file="$1" state="$2" decision="$3" row="$4" extra="$5"
  printf '# P\n\n## State\n\n%s\n\n## Decisions\n\n- 2026-11-12: %s\n\n## Sessions\n\n| Session | Status |\n|---|---|\n| %s | done |\n%s' \
    "$state" "$decision" "$row" "$extra" > "$file"
}
t() {
  local expect="$1" input="$2" out rc got
  out=$(echo "$input" | "$HOOK"); rc=$?
  got=$(echo "$out" | jq -r '.hookSpecificOutput.additionalContext // empty')
  if [ "$rc" -eq 0 ] && { { [ "$expect" = none ] && [ -z "$got" ]; } || { [ "$expect" != none ] && [[ "$got" == *"$expect"* ]]; }; }; then
    echo "ok    $expect"
  else
    echo "FAIL  expected $expect got '$got' exit $rc  $input"; fail=1
  fi
}
edit() { echo "{\"tool_name\":\"Edit\",\"tool_input\":{\"file_path\":\"$DIR/$1\"}}"; }
bash_cmd() { echo "{\"tool_name\":\"Bash\",\"tool_input\":{\"command\":\"$1\"}}"; }

ledger "$DIR/project-p.md" "short" "a rule" "s1"
t none "$(edit project-p.md)"
t none "$(bash_cmd "cd ~/.claude/investigations/p && cat >> project-p.md <<'EOF'")"

ledger "$DIR/project-p.md" "$(rep x 801)" "a rule" "s1"
t "State is 801 characters" "$(edit project-p.md)"
t "~/.claude/investigations/p/project-p.md:" "$(bash_cmd "cd ~/.claude/investigations/p && python3 - <<'EOF'\\np = 'project-p.md'")"

ledger "$DIR/project-p.md" "$(rep é 800)" "$(rep « 186)" "$(rep — 189)"
t none "$(edit project-p.md)"

ledger "$DIR/project-p.md" "short" "$(rep y 200)" "s1"
t "Decisions over 200 characters at lines 9:" "$(bash_cmd "f=project-p.md && sed -i '' 's/a/b/' \$f")"

ledger "$DIR/project-p.md" "short" "a rule" "$(rep z 200)"
t "Sessions rows over 200 characters besides URLs at lines 15:" "$(edit project-p.md)"

URL=https://gitlab.com/group/subgroup/project/-/merge_requests
ledger "$DIR/project-p.md" "short" "a rule" "\`p-s1\` (local_0123abcd-4567-89ef-0123-456789abcdef) | build-this | PROJ-1234 | MR open | \`claude/p-s1-0123ab\` | $URL/12345, $URL/12346"
t none "$(edit project-p.md)"

ledger "$DIR/project-p.md" "short" "a rule" "s1" $'\n## History\n\n- 2026-11-12: done\n'
t "A History section is in the ledger: move it to \`attachments/p-history.md\`" "$(edit project-p.md)"
ledger "$DIR/project-p.md" "short" "a rule" "s1" $'\n## History'
t "A History section is in the ledger" "$(edit project-p.md)"
ledger "$DIR/project-p.md" "short" "a rule" "s1" $'\n## Log\n\n- 2026-11-12: done\n\n## 2026-11-12 pass\n'
t "Sections outside the spec (Log, 2026-11-12 pass)" "$(edit project-p.md)"

ledger "$DIR/project-p.md" "short" "a rule" "s1" "$(for i in $(seq 120); do echo "| s$i | $(rep w 140) |"; done)"
t "bytes (budget 16384)" "$(edit project-p.md)"

ledger "$DIR/project-p.md" "$(rep x 801)" "a rule" "s1"
touch -t 202001010000 "$DIR/project-p.md"
t none "$(bash_cmd "grep -n State ~/.claude/investigations/p/project-p.md")"

ledger "$DIR/notes.md" "$(rep x 801)" "a rule" "s1"
t none "$(edit notes.md)"
ledger "$DIR/attachments/project-p-snapshot.md" "$(rep x 801)" "a rule" "s1"
t none "$(edit attachments/project-p-snapshot.md)"
t none "$(bash_cmd "cat project-missing.md")"
t none "$(bash_cmd "ls")"
t none '{"tool_name":"Read","tool_input":{}}'
t none 'not json'

SUP="$HOME/.claude/investigations/supervisor"
mkdir -p "$SUP/attachments"
supervisor() {
  local project="$1" session="$2" extra="$3"
  printf '# perso\n\n## Projects\n\n| Title | Session | Ledger | Repositories | Latest update |\n|---|---|---|---|---|\n| %s |\n\n## Filters\n\n## Reviews\n\n## Sessions\n\n| Item | Session | Status |\n|---|---|---|\n| %s |\n%s' \
    "$project" "$session" "$extra" > "$SUP/perso.md"
}
sup_edit() { echo "{\"tool_name\":\"Edit\",\"tool_input\":{\"file_path\":\"$SUP/$1\"}}"; }
ROW="🪐 P | local_0123abcd | [[project-p]] | o/p"

supervisor "$ROW | 2026-11-26: v1 released, $URL/1" "$URL/2 | s1 | running"
t none "$(sup_edit perso.md)"
t none "$(bash_cmd "cd ~/.claude/investigations/supervisor && cat perso.md")"

supervisor "$ROW | $(rep u 151)" "s1"
t "Latest updates over 150 characters at lines 7:" "$(bash_cmd "cd ~/.claude/investigations/supervisor && python3 - <<'EOF'\\np = 'perso.md'")"
supervisor "$ROW, $(rep r 360) | 2026-11-26: v1" "s1"
t "Projects rows over 400 characters besides URLs at lines 7:" "$(sup_edit perso.md)"
supervisor "$ROW | 2026-11-26: v1" "$(rep s 200)"
t "Sessions rows over 200 characters besides URLs at lines 17:" "$(sup_edit perso.md)"
supervisor "$ROW | 2026-11-26: v1" "s1" "$(for i in $(seq 60); do echo "| s$i | $(rep w 140) |"; done)"
t none "$(sup_edit perso.md)"
supervisor "$ROW | 2026-11-26: v1" "s1" "$(for i in $(seq 120); do echo "| s$i | $(rep w 140) |"; done)"
t "bytes (budget 16384): done sessions and those whose item went to a project leave Sessions" "$(sup_edit perso.md)"
t none "$(bash_cmd "cat ~/.claude/investigations/supervisor/xperso.md")"
touch -t 202001010000 "$SUP/perso.md"
t none "$(sup_edit perso.md)"

for i in $(seq 140); do echo "- 2026-11-26: $(rep h 180)"; done > "$SUP/attachments/perso-history.md"
t "perso-history.md: The file is 27300 bytes" "$(sup_edit attachments/perso-history.md)"
t "budget 24576): fold a section's oldest lines into one." "$(bash_cmd "cd ~/.claude/investigations/supervisor/attachments && echo x >> perso-history.md")"

exit $fail
