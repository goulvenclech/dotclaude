#!/bin/bash
HOOK="$(cd "$(dirname "$0")" && pwd)/wait-for-background-tasks.sh"
WT='"cwd":"/repo/.claude/worktrees/x/sub"'
SHELL_TASK='{"type":"shell","status":"running","command":"pnpm test"}'
fail=0
t() {
  local expect="$1" input="$2"
  local got
  got=$(echo "$input" | "$HOOK" | jq -r '.decision // "allow"')
  [ -z "$got" ] && got=allow
  if [ "$got" = "$expect" ]; then echo "ok    $expect  $input"; else echo "FAIL  expected $expect got $got  $input"; fail=1; fi
}
t block "{$WT,\"background_tasks\":[$SHELL_TASK]}"
t block "{$WT,\"background_tasks\":[{\"type\":\"subagent\",\"status\":\"running\"}]}"
t block "{$WT,\"stop_hook_active\":true,\"background_tasks\":[$SHELL_TASK]}"
t allow "{$WT,\"background_tasks\":[]}"
t allow "{$WT,\"background_tasks\":[{\"type\":\"shell\",\"status\":\"completed\"}]}"
t allow "{$WT}"
t allow "{\"cwd\":\"/repo\",\"background_tasks\":[$SHELL_TASK]}"
t allow "{\"cwd\":\"/repo/tiger/worktrees/x\",\"background_tasks\":[$SHELL_TASK]}"
t allow "{$WT,\"background_tasks\":[\"t1\"]}"
exit $fail
