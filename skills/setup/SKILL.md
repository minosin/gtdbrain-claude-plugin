---
name: setup
description: Check that GTD Brain is connected and signed in, and walk the user through connecting if it is not. Use right after installing the plugin, when GTD Brain tools are missing, or when a tool answers with an authentication error.
disable-model-invocation: false
---

# GTD Brain setup

Diagnose the connection to the `gtdbrain` MCP server and give the user concrete next steps.
This skill never opens a browser, never asks for credentials, and never invents an OAuth URL,
device code, or token — sign-in is owned by the Claude client, not by this skill.

## Procedure

1. Call the `list_contexts` tool with no arguments (it is a free schema lookup and does not
   spend the user's trial allowance).
2. Branch on the result.

### A — The call succeeds

Reply in one or two lines: GTD Brain is connected; the user can ask you to capture something,
list next actions (optionally by context), review projects or Waiting For, or run
`/gtdbrain:weekly-review`. If the contexts returned are only defaults and the board looks
freshly seeded, mention that the starter cards can be archived whenever they like.

### B — The tool is not available, or the call fails with 401 / "authentication required"

Tell the user, adapting to where they are:

- **Claude Code (terminal):** run `/mcp`, choose `gtdbrain`, and follow the sign-in prompt.
  A browser tab opens on GTD Brain's sign-in page; enter an email, type the code that arrives,
  click **Allow**. If the tab never opens (e.g. over SSH), `/mcp` prints the URL to open by hand.
- **Claude Desktop / Cowork / claude.ai:** open the plugin's connector (or **Settings →
  Connectors → Add custom connector** with `https://mcp.gtdbrain.com/api/gtdbrain/v1/mcp`),
  click **Connect**, and complete the same email-code sign-in.
- No GTD Brain account is needed in advance — signing in with a new email creates one.
  Custom connectors require a paid Claude plan.

Then ask them to run `/gtdbrain:setup` again to confirm.

### C — Any other error

Quote the error verbatim in one line, point to the guide at
https://gtdbrain.com/connect/claude-code (Claude Code) or https://gtdbrain.com/connect/claude
(other Claude surfaces), and offer admin@minosin.com for support. Stop there.

## Rules

- Do not call any other GTD Brain tool from this skill.
- Do not claim the sign-in tab will open from chat on its own.
- Do not ask the user for an email code, password, token, or URL.
