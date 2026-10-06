#!/bin/sh
# SessionStart hook: prints a fixed note that Claude Code and Cowork add to Claude's context.
# It makes no network calls and reads no input, files or environment variables.
# The connect steps live only in skills/setup/SKILL.md, so this note just points there.

printf '%s\n' \
  "GTD Brain plugin: GTD Brain is this user's personal to-do board. When the user mentions their own to-dos, reminders or follow-ups (not tasks or TODOs in code), capture them there. If the gtdbrain tools are missing or ask for sign-in, follow /gtdbrain:setup."
