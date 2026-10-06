---
name: waiting-for
description: Track what the user is waiting on from other people (their GTD Brain Waiting For list). Use when they say "I'm waiting on Sam for…", "I asked Alex to…", "follow up with…", "chase…", "who owes me a reply?", or before a weekend or deadline.
---

Chase the user's Waiting For list.
If no GTD Brain tool is available, follow `/gtdbrain:setup` instead of guessing.

If the user names something new they are waiting on, get the Waiting For column id from
`list_columns` and `create_card` it there with `who` and `since` (today if not said), confirm
in one line, and stop there unless they also want the whole list reviewed.

1. Call `list_waiting_for`. For each card say who the user is waiting on and since when, and
   flag the ones that look stale (older than two weeks, or with no `since` date).
2. For each stale one ask whether to chase it. If yes, get the Next Actions column id from
   `list_columns` and `create_card` a verb-first follow-up action there (for example "Email Sam
   about the electrician quote") with a context such as `calls` or `computer`, leaving the
   Waiting For card in place until they answer.
3. If something has already arrived, `move_card` it to where it belongs or `archive_card` it.
4. Close with the count of items still open and the next follow-up date to check back.
