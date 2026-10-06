# Changelog

## 1.2.0 — 2026-10-06

- A `SessionStart` hook for Claude Code and Cowork. A plain shell script
  (`hooks/session-start.sh`) prints one fixed note at session start: GTD Brain is the user's
  to-do board, capture their own to-dos there, and follow `/gtdbrain:setup` if the tools are
  missing. No network calls, no files, nothing sent anywhere. The connect steps stay in the
  `setup` skill only. Described in the README under "Session hook".

## 1.1.1 — 2026-10-06

- README and the `setup` skill lead with the Connect step: on claude.ai, Claude Desktop and
  Cowork, installing the plugin does not connect its MCP server, so open the plugin's
  Connectors tab and connect GTD Brain.
- The `setup` skill and SETUP.md give the full path (Customize → Plugins → GTD Brain →
  Connectors tab) and no longer send plugin users to add a second, custom connector. The
  custom-connector route is now only for people who use GTD Brain without the plugin. The
  `gtd` skill sends authentication errors to `setup` too.
- SETUP.md drops the old free-allowance wording.
- Skill descriptions lead with how people talk ("add to my to-do list", "remind me to",
  "what should I do today", "plan my week", "follow up with…", "I'm waiting on…") instead of
  GTD terms, so Claude picks the skills up more often. Each stays tied to the user's own
  to-dos and rules out TODOs or tasks in a code project.
- Every skill that can start a conversation sends the user to `/gtdbrain:setup` when the
  GTD Brain tools are missing; `waiting-for` can add a new item someone owes the user.

## 1.1.0 — 2026-10-04

- Follows the server's current membership behaviour: on an account without a membership a
  write still lands on the board and the reply ends with a short notice; a read returns the
  notice. The `gtd` and `setup` skills describe that instead of a free allowance.
- 20 tools (adds `show_board` and the context tools); board results render as an inline card
  in Claude's web, desktop and mobile apps.

## 1.0.0 — 2026-09-13

- First release: GTD Brain hosted MCP server (`https://mcp.gtdbrain.com/api/gtdbrain/v1/mcp`),
  the `gtd` skill, and the `capture`, `what-now`, `inbox-zero`, `weekly-review`, `waiting-for`,
  and `setup` slash commands.
