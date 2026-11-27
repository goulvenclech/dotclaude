#!/bin/bash
# Warns, never blocks, when a project or supervisor ledger outgrows its spec.
# Most ledger writes are Bash commands that cd into the folder and name the file
# bare, so any `project-*.md` name is looked up in ~/.claude/investigations, and
# only a file changed in the last 10 seconds counts, to skip reads.

INPUT=$(cat)
TEXT=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.command // empty' 2>/dev/null)
[ -z "$TEXT" ] && exit 0
NAMES=$(echo "$TEXT" | grep -oE 'project-[A-Za-z0-9._-]+\.md' | sort -u)

NOW=$(date +%s)
WARN=""
recent() {
  local mtime
  mtime=$(stat -c %Y "$1" 2>/dev/null || stat -f %m "$1" 2>/dev/null)
  [ $((NOW - ${mtime:-0})) -le 10 ]
}
LINES='def refs: (.[:5] | join(", ")) + (if length > 5 then " and \(length - 5) more" else "" end);
  def len: gsub("https?://[^\\s|]+"; "U") | length;
  [foreach (split("\n") | to_entries[]) as $e ({sec: null};
    if ($e.value | startswith("## ")) then .sec = $e.value[3:] else . end;
    {sec, n: ($e.key + 1), l: $e.value})
  | select(.l | startswith("## ") | not)] as $all
  | def body($s): [$all[] | select(.sec == $s)];
  def over($s; $max): [body($s)[] | select((.l | startswith("|")) and (.l | len) > $max) | .n | tostring];'
for name in $NAMES; do
  for f in "$HOME"/.claude/investigations/*/"$name"; do
    [ -f "$f" ] && recent "$f" || continue
    HIST="${name#project-}"
    # jq counts characters, not bytes, for the caps; the budget is in bytes.
    MSG=$(jq -Rrs --arg file "~/${f#"$HOME"/}" --arg hist "attachments/${HIST%.md}-history.md" --argjson bytes "$(wc -c < "$f")" "$LINES"'
      [split("\n")[] | select(startswith("## ")) | .[3:]] as $heads
      | ($heads - ["Sources", "Git", "Ledgers", "State", "Decisions", "Next steps", "Sessions", "History"]) as $extra
      | ([body("State")[].l] | join("\n") | gsub("^\\s+|\\s+$"; "") | length) as $state
      | [body("Decisions")[] | select((.l | startswith("- ")) and (.l | length) > 200) | .n | tostring] as $dec
      | over("Sessions"; 200) as $ses
      | [
          (if $state > 800 then "State is \($state) characters (max 800): keep where the project stands and what waits on the user, the detail goes to the sessions'"'"' ledgers or `attachments/`." else empty end),
          (if ($dec | length) > 0 then "Decisions over 200 characters at lines \($dec | refs): keep the rule, its why goes to a session'"'"'s ledger or `attachments/`." else empty end),
          (if ($ses | length) > 0 then "Sessions rows over 200 characters besides URLs at lines \($ses | refs): keep the id, skill, ticket, status, branch and MR/PR URLs, the narrative goes to the session'"'"'s ledger." else empty end),
          (if any($heads[]; . == "History") then "A History section is in the ledger: move it to `\($hist)`, one dated line per session done or scope change." else empty end),
          (if ($extra | length) > 0 then "Sections outside the spec (\($extra | refs)): a journal goes to `\($hist)`, the rest to State, Decisions or a session'"'"'s ledger." else empty end),
          (if $bytes > 16384 then "The file is \($bytes) bytes (budget 16384): done steps leave Next steps, plans go to `attachments/`." else empty end)
        ]
      | if length > 0 then "\($file): " + join(" ") else empty end' "$f" 2>/dev/null)
    [ -n "$MSG" ] && WARN="$WARN $MSG"
  done
done

# Supervisor ledgers have short generic names (perso.md), so each one is matched
# by its basename in the input rather than by a pattern.
for f in "$HOME"/.claude/investigations/supervisor/*.md "$HOME"/.claude/investigations/supervisor/attachments/*-history.md; do
  [ -f "$f" ] || continue
  base=$(basename "$f")
  echo "$TEXT" | grep -qE "(^|[^A-Za-z0-9._-])${base//./\\.}" && recent "$f" || continue
  BYTES=$(( $(wc -c < "$f") ))
  if [[ "$f" == */attachments/* ]]; then
    [ "$BYTES" -gt 24576 ] && WARN="$WARN ~/${f#"$HOME"/}: The file is $BYTES bytes (budget 24576): fold a section's oldest lines into one."
    continue
  fi
  MSG=$(jq -Rrs --arg file "~/${f#"$HOME"/}" --arg hist "attachments/${base%.md}-history.md" --argjson bytes "$BYTES" "$LINES"'
      [body("Projects")[] | select((.l | startswith("|")) and (.l | split("|") | .[-2] // "" | gsub("^\\s+|\\s+$"; "") | len) > 150) | .n | tostring] as $upd
      | [
          (if ($upd | length) > 0 then "Latest updates over 150 characters at lines \($upd | refs): keep the date, the fact, and its MR/PR, commit, or release." else empty end),
          (over("Projects"; 400) as $p | if ($p | length) > 0 then "Projects rows over 400 characters besides URLs at lines \($p | refs): past facts go to `\($hist)`." else empty end),
          (over("Sessions"; 200) as $s | if ($s | length) > 0 then "Sessions rows over 200 characters besides URLs at lines \($s | refs): keep the item, session, and status." else empty end),
          (if $bytes > 16384 then "The file is \($bytes) bytes (budget 16384): done sessions and those whose item went to a project leave Sessions, past facts go to `\($hist)`." else empty end)
        ]
      | if length > 0 then "\($file): " + join(" ") else empty end' "$f" 2>/dev/null)
  [ -n "$MSG" ] && WARN="$WARN $MSG"
done
[ -z "$WARN" ] && exit 0

jq -n --arg w "$WARN" '{hookSpecificOutput:{hookEventName:"PostToolUse",additionalContext:("From ~/.claude/hooks/ledger-budget.sh, for the conversation that keeps this ledger, any other session ignores it:" + $w)}}'
exit 0
