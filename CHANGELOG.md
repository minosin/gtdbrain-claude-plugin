# Changelog

## 1.1.1 — 2026-10-06

- README and the `setup` skill lead with the Connect step: on claude.ai, Claude Desktop and
  Cowork, installing the plugin does not connect its MCP server, so open the plugin's
  Connectors tab and click Connect.
- SETUP.md drops the old free-allowance wording.

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
