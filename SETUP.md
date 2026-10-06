# Setting up GTD Brain

This plugin connects Claude to GTD Brain's hosted MCP server. There is nothing to install
and no API key: the first tool call opens GTD Brain's sign-in page, you enter your email,
type the code we send you, and click **Allow**. A new email creates an account.

## Steps Claude should follow after install

1. Call `list_contexts` (a free schema lookup). If it succeeds, GTD Brain is connected — say
   so and offer `/gtdbrain:what-now` or a capture.
2. If the tool is missing or answers with 401 / "authentication required", tell the user how
   to sign in where they are:
   - **Claude Code:** `/mcp` → `gtdbrain` → follow the prompt (it prints the URL if no browser
     opens).
   - **claude.ai / Claude Desktop / Cowork:** installing does not connect it. Left sidebar →
     **Customize → Plugins → GTD Brain** → **Connectors** tab → connect **GTD Brain**.
     Only people using GTD Brain without the plugin add a custom connector (**Settings →
     Connectors → Add custom connector** with `https://mcp.gtdbrain.com/api/gtdbrain/v1/mcp`).
3. Never fabricate a sign-in URL, device code, or token, and never ask for the email code —
   the Claude client owns the OAuth flow.
4. After sign-in, run `/gtdbrain:setup` again to confirm, then archive the starter cards if
   the user wants a clean board.

## Requirements

- A paid Claude plan (custom connectors and remote-MCP plugins need one).
- A GTD Brain account — created on first sign-in. Using the board needs a GTD Brain
  membership.

## Guides and support

- Claude Code: https://gtdbrain.com/connect/claude-code
- Claude (web, desktop, Cowork): https://gtdbrain.com/connect/claude
- Support: admin@minosin.com
