# Ashfall

A dark 2D platformer built with Godot 4.

---

## Requirements

Before you clone, make sure you have these installed:

| Tool | Version | Download |
|------|---------|----------|
| Godot | 4.x | https://godotengine.org/download |
| Git | Latest | https://git-scm.com |
| Git LFS | Latest | https://git-lfs.com |

---

## Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/YOUR_USERNAME/ash-fall.git
cd ash-fall
```

### 2. Set up Git LFS

This is required — skipping it means your assets won't download correctly.

```bash
git lfs install
git lfs pull
```

### 3. Open in Godot

- Open Godot
- Click **Import**
- Navigate to your `ash-fall` folder and select `project.godot`
- Let Godot finish reimporting assets (first open takes a moment)

You're ready to go.

---

## Folder Structure

```
ash-fall/
├── assets/
│   ├── audio/
│   │   ├── music/
│   │   └── sfx/
│   ├── fonts/
│   ├── textures/
│   │   ├── characters/
│   │   ├── environment/
│   │   └── ui/
│   └── models/
├── scenes/
│   ├── main/          # Main game scenes and entry points
│   ├── levels/        # Individual level scenes
│   ├── player/        # Player scene and sub-scenes
│   ├── enemies/       # Enemy scenes
│   ├── ui/            # HUD, menus, overlays
│   └── shared/        # Reusable scenes used across levels
├── scripts/
│   ├── autoload/      # Singletons (GameManager, AudioManager, etc.)
│   ├── player/
│   ├── enemies/
│   ├── components/    # Reusable script components
│   └── ui/
├── shaders/
└── addons/            # Godot plugins
```

---

## Branch Workflow

We use a simple three-tier branch strategy:

```
main          → always stable, represents the latest release
dev           → integration branch, all features merge here first
feature/xxx   → your day-to-day work branch
```

### Starting a new feature

```bash
git checkout dev
git pull origin dev
git checkout -b feature/your-feature-name
```

### Finishing a feature

Push your branch and open a Pull Request into `dev` on GitHub.
- PRs require at least **1 approval** before merging
- Never push directly to `main` or `dev`

### Releases

When `dev` is stable and tested, one of the leads will open a PR from `dev` → `main`.

---

## Scene Ownership

Godot `.tscn` files don't merge well. To avoid conflicts:

- **Check in the team chat before editing a shared scene**
- Try to work on scenes you own, or create new sub-scenes rather than editing existing ones
- If you must edit a shared scene, communicate and coordinate

---

## Reporting Bugs

Use GitHub Issues for all bugs and tasks:

1. Go to the **Issues** tab on GitHub
2. Click **New Issue**
3. Use the appropriate template (Bug or Feature)
4. Assign it to someone if known

---

## Commit Message Format

Keep commits readable:

```
feat: add double jump mechanic
fix: player stuck on slope collision
chore: reorganise texture folders
docs: update README setup steps
```

Prefixes: `feat` `fix` `chore` `docs` `refactor` `test`

---

## Need Help?

- Tag a teammate in your PR
- Open a GitHub Issue
- Check the Godot 4 docs: https://docs.godotengine.org
