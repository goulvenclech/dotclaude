#!/bin/bash
# Each turn end of a session started by another one wakes its parent. The hook
# cannot tell those sessions apart, so it holds the turn of any session in a
# `.claude/worktrees` worktree, where they run, while background tasks run.
# stop_hook_active is ignored: each foreground wait is a tool call, which
# resets the block cap.

INPUT=$(cat)
case "$(echo "$INPUT" | jq -r '.cwd // empty')" in
  */.claude/worktrees/*) ;;
  *) exit 0 ;;
esac
RUNNING=$(echo "$INPUT" | jq '[.background_tasks[]? | select(.status == "running")] | length' 2>/dev/null)
[ "${RUNNING:-0}" -eq 0 ] && exit 0

jq -n '{decision:"block",reason:"Blocked by ~/.claude/hooks/wait-for-background-tasks.sh: ending the turn now may wake the session that started this one. Wait for the background work in the foreground, with a bounded loop on its condition or `for i in $(seq 1 9); do sleep 10; done`, then check again. A server, preview or watcher never finishes: stop it with `TaskStop` first."}'
