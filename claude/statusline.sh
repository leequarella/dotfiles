#!/usr/bin/env bash
# Claude Code status line wrapper:
#   renders claude-powerline, then appends a short summary of the current task
#   (the most recent real user message) as a trailing  ✎ …  segment.
# claude-powerline has no custom/command segment, hence this wrapper.
# Receives the status JSON payload on stdin.

input=$(cat)

# 1) Render the powerline (pass the payload through unchanged).
line=$(printf '%s' "$input" | npx -y @owloops/claude-powerline@latest 2>/dev/null)

# 2) Derive the current-task summary from the transcript.
transcript=$(printf '%s' "$input" | jq -r '.transcript_path // empty' 2>/dev/null)
task=""
if [ -n "$transcript" ] && [ -f "$transcript" ]; then
  # Scan the tail of the transcript (last real user msg is ~always near the end);
  # bounded for speed. jq -s is portable (no BSD-only `tail -r`/GNU `tac`).
  task=$(tail -n 80 "$transcript" 2>/dev/null | jq -rs '
    map(select(.type=="user")
        | (.message.content) as $c
        | (if   ($c|type)=="string" then $c
           elif ($c|type)=="array"  then ($c | map(select(.type=="text") | .text) | join(" "))
           else empty end))
    | map(select(. != null
                 and (test("^\\s*<") | not)              # skip harness/tool tags
                 and (gsub("\\s";"") | length > 0)))
    | last // empty' 2>/dev/null)
  # Collapse whitespace and truncate.
  task=$(printf '%s' "$task" | tr '\n' ' ' | tr -s ' ' | sed 's/^ *//; s/ *$//')
  if [ "${#task}" -gt 50 ]; then
    task="${task:0:47}..."
  fi
fi

# 3) Emit powerline, then the task summary.
printf '%s' "$line"
[ -n "$task" ] && printf '  ✎ %s' "$task"
