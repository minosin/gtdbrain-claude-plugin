# GTD Brain — Claude plugin

**After installing, connect it: Customize → Plugins → GTD Brain → Connectors tab.** Then sign
in with your email code. Until you do, Claude has none of the GTD Brain tools. (In Claude Code, run
`/mcp` and choose `gtdbrain` instead.)

<img src="https://gtdbrain.com/gtdbrain/icon-512.png" alt="GTD Brain" width="96" align="right">

Your [Getting Things Done](https://gtdbrain.com/gtd-ai?source=claude-plugin) board inside Claude. Capture what's on your
mind straight to your Inbox, pull up next actions by context, keep projects and Waiting For
honest, and run a proper weekly review — on the same board as the GTD Brain web, iOS, and
Android apps, synced in real time.

The plugin bundles GTD Brain's **hosted MCP server** (you sign in with an email code — no API
key, nothing to install) plus GTD skills and slash commands that teach Claude the method.

Away from Claude, message the GTD Brain bot on Telegram
([@GTDBrainBot](https://t.me/GTDBrainBot?start=claude-plugin)), typed or as a voice note, and it
lands in the same Inbox.

## What you get

- **20 MCP tools** — `capture`, `list_next_actions`, `list_projects`, `list_waiting_for`,
  `show_board`, `search_cards`, `create_card`, `update_card`, `move_card`, `archive_card`,
  context management, and more. Claude calls them on its own when you talk about your tasks.
  In Claude's web, desktop and mobile apps the board results render as an inline card you can
  tick items off on; Claude Code gets the same results as text.
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
- **A session-start note** (Claude Code and Cowork) — a small shell script tells Claude that
  GTD Brain is your to-do board, and to help you connect if the tools are missing. See
  [Session hook](#session-hook).

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

1. Install GTD Brain from the plugin directory.
2. In the left sidebar, open **Customize → Plugins → GTD Brain**, go to the **Connectors**
   tab, and connect **GTD Brain**. Installing alone does not connect it.
3. Enter your email, type the code we send you, and click **Allow**.

Full guide with screenshots: [gtdbrain.com/connect/claude](https://gtdbrain.com/connect/claude?source=claude-plugin).

Without the plugin, you can add the same server as a custom connector: **Settings →
Connectors → Add custom connector**, name it *GTD Brain*, and paste

```
https://mcp.gtdbrain.com/api/gtdbrain/v1/mcp
```

> Custom connectors require a paid Claude plan. Claude may label GTD Brain an unverified
> third-party connector when you connect — that is the expected notice for any independent
> MCP server.

## Try it

- *Empty my head: I'll list everything on my mind, you capture each one to my inbox.*
- *What can I do right now? I'm at my computer with 30 minutes.*
- *Show my projects and flag any that have no next action.*
- *Run my weekly review with me, list by list.*
- *Show my Waiting For list — anything I should chase before the weekend?*

## Account and pricing

- No account needed in advance: signing in with a new email creates one.
- GTD Brain is a paid membership, the one that also covers the web, iOS, and Android apps.
  Without one, anything you capture still lands on your board and the reply says what the
  account needs; reading the board needs the membership. Plans at
  [gtdbrain.com/pricing](https://gtdbrain.com/pricing?source=claude-plugin).

## Privacy, terms, and support

- Privacy policy: https://gtdbrain.com/privacy
- Terms of use: https://gtdbrain.com/terms
- Data stays in your GTD Brain account. The only code the plugin runs on your machine is
  [`hooks/session-start.sh`](./hooks/session-start.sh), which prints a fixed note and nothing
  else (see [Session hook](#session-hook)); the rest is configuration and skill text you can
  read in this repository.
- Support and security reports: **admin@minosin.com**. Disconnect at any time from your
  Claude client's connector settings.

## How it works

`.mcp.json` points Claude at `https://mcp.gtdbrain.com/api/gtdbrain/v1/mcp`, a streamable-HTTP
MCP server with OAuth 2.1 sign-in (dynamic client registration; the server card is at
[`/.well-known/mcp/server-card.json`](https://mcp.gtdbrain.com/.well-known/mcp/server-card.json)).
The `skills/` folder holds the GTD instructions Claude follows, and `hooks/` holds the
session hook below. Nothing else.

## Session hook

The plugin registers one `SessionStart` hook ([`hooks/hooks.json`](./hooks/hooks.json)). It
runs in Claude Code and Cowork; claude.ai ignores plugin hooks. When a session starts, is
cleared, or is compacted, it runs [`hooks/session-start.sh`](./hooks/session-start.sh), a plain
shell script that prints this one fixed note, which Claude reads as context:

> GTD Brain plugin: GTD Brain is this user's personal to-do board. When the user mentions their
> own to-dos, reminders or follow-ups (not tasks or TODOs in code), capture them there. If the
> gtdbrain tools are missing or ask for sign-in, follow /gtdbrain:setup.

The note is the same every time. The script makes **no network calls**, reads **no files,
environment variables or input**, writes nothing, and sends nothing anywhere. It cannot tell
whether you are signed in, so the note only says what to do if the tools are missing. To turn
it off, disable the plugin (`/plugin` in Claude Code).

## License

MIT — see [LICENSE](./LICENSE). GTD® and Getting Things Done® are registered trademarks of
the David Allen Company; GTD Brain is not affiliated with or endorsed by it.
