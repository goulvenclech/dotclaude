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

exit $fail
