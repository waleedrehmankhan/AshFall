# Contributing to Ashfall

Welcome to the team! This document covers everything you need to know to contribute effectively.

---

## Before You Start

- Read the [README](README.md) to get the project running locally
- Read [CONVENTIONS.md](CONVENTIONS.md) for code and naming standards
- Check the **Issues** tab on GitHub — pick something assigned to you or ask in the notion chat before starting something new or check NOTION Dashboard.

---

## Branch Workflow

We follow a simple three-tier model:

```
main        → stable builds only, never work here directly
dev         → integration branch, all features land here first
feature/*   → your personal work branch
```

### Starting work

Always branch off `dev`, never `main`:

```bash
git checkout dev
git pull origin dev
git checkout -b feature/your-feature-name
```

**Branch naming examples:**

- `feature/player-jump`
- `feature/level-01-tilemap`
- `fix/enemy-patrol-bug`
- `chore/reorganise-audio-folder`

### Keeping your branch up to date

If `dev` moves forward while you're working, rebase rather than merge:

```bash
git fetch origin
git rebase origin/dev
```

---

## Opening a Pull Request

When your feature is ready:

1. Push your branch to GitHub

```bash
git push origin feature/your-feature-name
```

2. Go to GitHub → **Pull Requests** → **New Pull Request**
3. Set base branch to `dev` (not `main`)
4. Fill in the PR description — what changed and why also add notion #Ticket ID
5. Request a review from at least one teammate
6. Wait for approval before merging

**PR description template:**

```
## What changed
Brief description of what this PR does.

## Why
Why was this change needed?

## How to test
Steps to verify the change works correctly.

## Screenshots (if visual)
Before / after if relevant.
```

---

## Scene Ownership & Conflict Avoidance

Godot `.tscn` files do not merge cleanly. Follow these rules to avoid painful conflicts:

- **Communicate before editing a shared scene** — post in the notion chat — VERY IMPORTANT
- Work on scenes you own where possible
- Prefer creating **new sub-scenes** over editing existing shared ones
- If two people need to edit the same scene, coordinate who goes first

---

## Commit Messages

Follow this format:

```
type: short description in lowercase
```

| Prefix     | When to use                               |
| ---------- | ----------------------------------------- |
| `feat`     | New feature or mechanic                   |
| `fix`      | Bug fix                                   |
| `chore`    | Maintenance, folder changes, config       |
| `docs`     | README, comments, documentation           |
| `refactor` | Code restructure with no behaviour change |
| `test`     | Adding or updating tests                  |

**Examples:**

```
feat: add coyote time to player jump
fix: enemy patrol stops at wall correctly
chore: move placeholder textures to correct folder
docs: add autoload responsibilities to CONVENTIONS
```

- Keep the first line under 72 characters
- No full stops at the end
- Use present tense — "add feature" not "added feature"

---

## Reporting Bugs

Use GitHub Issues with the **Bug Report** template. Include:

- Steps to reproduce
- What you expected vs what happened
- Screenshots or video if possible
- Which branch/commit you were on

---

## Requesting Features

Use GitHub Issues with the **Feature Request** template. Discuss bigger ideas in the notion chat before opening an issue so everyone is aligned.

---

## Questions?

Tag a teammate in your PR, open a GitHub Issue, or ask in the notion chat. Nobody should be blocked silently.
