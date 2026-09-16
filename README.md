# GTD Brain — Claude plugin

<img src="https://gtdbrain.com/gtdbrain/icon-512.png" alt="GTD Brain" width="96" align="right">

Your [Getting Things Done](https://gtdbrain.com/gtd-ai?source=claude-plugin) board inside Claude. Capture what's on your
mind straight to your Inbox, pull up next actions by context, keep projects and Waiting For
honest, and run a proper weekly review — on the same board as the GTD Brain web, iOS, and
Android apps, synced in real time.

The plugin bundles GTD Brain's **hosted MCP server** (you sign in with an email code — no API
key, nothing to install) plus GTD skills and slash commands that teach Claude the method.

## What you get

- **16 MCP tools** — `capture`, `list_next_actions`, `list_projects`, `list_waiting_for`,
  `search_cards`, `create_card`, `update_card`, `move_card`, `archive_card`, context
  management, and more. Claude calls them on its own when you talk about your tasks.
- **A GTD skill** that keeps Claude honest: capture first and clarify later, verb-first next
  actions, every project has a next action, never answer about your board from memory.
- **Slash commands**
  - `/gtdbrain:capture <text>` — one or many items straight to the Inbox
  - `/gtdbrain:what-now [context]` — the two or three actions that fit right now
  - `/gtdbrain:inbox-zero` — clarify every Inbox card, one at a time
  - `/gtdbrain:weekly-review` — Get Clear · Get Current · Get Creative
  - `/gtdbrain:waiting-for` — find stale delegated items and create follow-ups
  - `/gtdbrain:setup` — check the connection and walk through sign-in
- **Safety by design** — Claude can read, add, edit, move, and archive cards, but can never
  delete one. Archived cards stay recoverable.

## Install

### Claude Code

```
/plugin marketplace add minosin/gtdbrain-claude-plugin
/plugin install gtdbrain@gtdbrain
```

Then run `/mcp`, choose `gtdbrain`, and sign in with your email code (or just ask Claude
about your inbox — the sign-in tab opens on the first call). `/gtdbrain:setup` confirms the
connection. Full guide: [gtdbrain.com/connect/claude-code](https://gtdbrain.com/connect/claude-code?source=claude-plugin).

### Claude Desktop, Cowork, and claude.ai

Install the plugin from the plugin directory once it is listed there, or add GTD Brain as a
custom connector: **Settings → Connectors → Add custom connector**, name it *GTD Brain*, and
paste

```
https://mcp.gtdbrain.com/api/gtdbrain/v1/mcp
```

Click **Connect**, enter your email, type the code we send you, click **Allow**. Full guide
with screenshots: [gtdbrain.com/connect/claude](https://gtdbrain.com/connect/claude?source=claude-plugin).

> Custom connectors require a paid Claude plan. Because GTD Brain is not (yet) in Anthropic's
> Connectors Directory, Claude may label it an unverified third-party connector when you
> install — that is the expected notice for any independent MCP server.

## Try it

- *Empty my head: I'll list everything on my mind, you capture each one to my inbox.*
- *What can I do right now? I'm at my computer with 30 minutes.*
- *Show my projects and flag any that have no next action.*
- *Run my weekly review with me, list by list.*
- *Show my Waiting For list — anything I should chase before the weekend?*

## Account and pricing

- No account needed in advance: signing in with a new email creates one.
- After connecting, free accounts get a handful of tool actions to try the connection.
  Ongoing use needs a GTD Brain subscription — the one subscription that also covers the web,
  iOS, and Android apps. Pricing at [gtdbrain.com](https://gtdbrain.com/?source=claude-plugin).

## Privacy, terms, and support

- Privacy policy: https://gtdbrain.com/privacy
- Terms of use: https://gtdbrain.com/terms
- Data stays in your GTD Brain account; the plugin itself contains no code that runs on your
  machine — only this configuration and the skill text you can read in this repository.
- Support and security reports: **admin@minosin.com**. Disconnect at any time from your
  Claude client's connector settings.

## How it works

`.mcp.json` points Claude at `https://mcp.gtdbrain.com/api/gtdbrain/v1/mcp`, a streamable-HTTP
MCP server with OAuth 2.1 sign-in (dynamic client registration; the server card is at
[`/.well-known/mcp/server-card.json`](https://mcp.gtdbrain.com/.well-known/mcp/server-card.json)).
The `skills/` folder holds the GTD instructions Claude follows. Nothing else.

## License

MIT — see [LICENSE](./LICENSE). GTD® and Getting Things Done® are registered trademarks of
the David Allen Company; GTD Brain is not affiliated with or endorsed by it.
