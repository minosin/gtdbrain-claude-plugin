---
name: capture
description: Capture one or more things to the user's GTD Brain Inbox. Use when the user says "capture", "add to my inbox", "remind me to", "I need to", or lists things on their mind.
argument-hint: <what to capture>
---

Capture "$ARGUMENTS" to the user's GTD Brain Inbox.

- If the text holds several distinct items (separate lines, "and", commas between unrelated
  things), call `capture` once per item, each with a short, specific title. Keep any detail
  that does not belong in the title in `notes`.
- If `$ARGUMENTS` is empty, ask what to capture — invite the user to empty their head and
  list everything, then capture each item.
- Do not clarify, prioritise, or assign contexts now; capture goes to the Inbox raw.
  Clarifying happens in `/gtdbrain:inbox-zero`.
- Confirm with the created titles in one line, and if any item obviously needs several
  steps, offer to turn it into a project with a first next action.
