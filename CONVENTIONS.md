# Code & Naming Conventions

This document defines the conventions we follow in Ashfall. Consistency across the codebase makes collaboration easier — please read this before writing your first script.

---

## File & Folder Naming

| Type    | Convention | Example                 |
| ------- | ---------- | ----------------------- |
| Scenes  | PascalCase | `PlayerController.tscn` |
| Scripts | snake_case | `player_controller.gd`  |
| Shaders | snake_case | `water_ripple.gdshader` |
| Folders | snake_case | `scripts/components/`   |
| Assets  | snake_case | `tileset_cave_01.png`   |

---

## GDScript Conventions

### Variables

```gdscript
# Public variables — snake_case
var health: int = 100
var move_speed: float = 200.0

# Private variables — prefix with underscore
var _is_jumping: bool = false
var _current_state: String = ""

# Constants — ALL_CAPS
const MAX_HEALTH: int = 100
const GRAVITY: float = 980.0

# Exported variables — snake_case with @export
@export var jump_force: float = 400.0
@export var damage: int = 10
```

### Functions

```gdscript
# Public functions — snake_case
func take_damage(amount: int) -> void:
    pass

# Private functions — prefix with underscore
func _update_animation() -> void:
    pass

# Always use type hints
func calculate_damage(base: int, multiplier: float) -> int:
    return int(base * multiplier)
```

### Signals

```gdscript
# snake_case, past tense describes what happened
signal player_died
signal health_changed(new_health: int)
signal level_completed(level_id: String)
```

### Enums

```gdscript
# PascalCase for enum name, ALL_CAPS for values
enum PlayerState {
    IDLE,
    RUNNING,
    JUMPING,
    DEAD
}
```

### Classes

```gdscript
# PascalCase, always at the top of the file
class_name PlayerController
extends CharacterBody2D
```

---

## Node Naming (Scene Tree)

| Type             | Convention | Example                       |
| ---------------- | ---------- | ----------------------------- |
| All nodes        | PascalCase | `PlayerSprite`, `HealthBar`   |
| Unique nodes ($) | PascalCase | `$AnimationPlayer`            |
| Groups           | snake_case | `"enemies"`, `"collectibles"` |

Keep node names descriptive — avoid generic names like `Node2D` or `Sprite` unless it's a truly generic helper node.

---

## Script Structure

Always follow this order inside a GDScript file:

```gdscript
class_name PlayerController
extends CharacterBody2D

# 1. Signals
signal health_changed(new_health: int)

# 2. Enums
enum PlayerState { IDLE, RUNNING, JUMPING }

# 3. Constants
const MAX_HEALTH: int = 100

# 4. Exported variables
@export var move_speed: float = 200.0

# 5. Public variables
var health: int = MAX_HEALTH

# 6. Private variables
var _current_state: PlayerState = PlayerState.IDLE

# 7. Built-in functions (_ready, _process, _physics_process)
func _ready() -> void:
    pass

func _physics_process(delta: float) -> void:
    pass

# 8. Public functions
func take_damage(amount: int) -> void:
    pass

# 9. Private functions
func _update_animation() -> void:
    pass

# 10. Signal callbacks (on_ prefix)
func _on_hitbox_body_entered(body: Node2D) -> void:
    pass
```

---

## Scene Structure Guidelines

- Every scene should have **one clear responsibility** — a Player scene handles player logic, not enemy spawning
- Keep scene trees shallow where possible — deeply nested nodes are hard to debug
- Use **sub-scenes** for anything reusable (a health bar, a hitbox, a pickup)
- Name the root node the same as the scene file — `PlayerController.tscn` root node should be named `PlayerController`

---

## Autoloads (Singletons)

These live in `scripts/autoload/` and are registered in Project Settings:

| Singleton      | Responsibility                    |
| -------------- | --------------------------------- |
| `GameManager`  | Game state, score, level tracking |
| `AudioManager` | Playing music and SFX             |
| `SceneManager` | Scene transitions and loading     |

**Rule:** If logic doesn't belong to a specific object, it probably belongs in one of these. Don't create new autoloads without discussing with the team first.

---

## Comments

```gdscript
# Use comments to explain WHY, not WHAT
# Bad:
health -= 10  # subtract 10 from health

# Good:
health -= 10  # fall damage ignores armour by design

# Use TODO for things to come back to
# TODO: replace placeholder with actual death animation

# Use FIXME for known bugs
# FIXME: player can jump twice if button mashed on landing
```

---

## General Rules

- **Type everything** — always use type hints on variables and function signatures
- **No magic numbers** — use named constants instead of raw values like `200.0` or `42`
- **One script per scene** — avoid attaching multiple scripts to the same node
- **Keep functions short** — if a function is over ~30 lines, consider splitting it
- **No print() in final commits** — use `push_warning()` or `push_error()` for debug output, or remove before committing to `dev`
