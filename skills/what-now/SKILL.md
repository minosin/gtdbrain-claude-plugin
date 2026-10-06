---
name: what-now
description: Suggest what the user should do now from their own to-do list (GTD Brain next actions). Use when they ask "what should I do today?", "what can I get done in 30 minutes?", "I'm out, any errands?", or say where they are or how much time or energy they have. Not for choosing coding tasks in a repo.
argument-hint: [context, e.g. calls, computer, errands, home]
---

Help the user decide what to do right now. Context hint from the user: "$ARGUMENTS".
If no GTD Brain tool is available, follow `/gtdbrain:setup` instead of guessing.

1. If a context was given, call `list_next_actions` with it; if the tool says the context is
   unknown, pick the closest id from the list it returns and say which one you used.
   Otherwise call `list_next_actions` with no filter.
2. Pick the two or three actions that fit best (context, and any time or energy the user
   mentioned) and say briefly why each fits.
3. If nothing fits, call `list_projects`, find a project that has no matching next action,
   and help the user define one with `create_card` (kind `action`, verb-first, in Next Actions).
4. Finish with one suggestion the user can act on through you (start the first action, move
   something to Waiting For, capture what came up).
