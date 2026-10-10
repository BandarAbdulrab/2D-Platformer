# 2D Platformer

A classic 2D retro platformer developed in **Godot Engine 4** using **GDScript**[cite: 1]. Navigate treacherous terrain, overcome patrol hazards, collect cherries, and reach the finish flag across multiple levels[cite: 1].

---

## Features

* **Physics-Based Platforming:** Full character controller featuring running, jumping, double-jumping, falling, and wall-jump interactions[cite: 1].
* **Patrol Enemies:** Rigidbody-based mushroom enemies (`rigid_body_2d_(mush_enemy)`) with collision interactions and stomp detection[cite: 1].
* **Collectibles & Health Tracker:** Cherry pickups and persistent heart-based health management controlled via `game_manager.gd`[cite: 1].
* **Hazard Zones:** Out-of-bounds fall triggers (`fall_area.gd`) that catch missed jumps and reset level states[cite: 1].
* **Moving Platforms:** Kinematic obstacles powered by `AnimatableBody2D` for vertical and horizontal platform routes[cite: 1].
* **Multi-Level Flow:** Level sequencing across `Level1.tscn` and `Level2.tscn` driven by stage-clearing finish triggers (`finish.tscn`)[cite: 1].
* **Cross-Platform Input:** Dual control scheme supporting physical keyboards and a mobile virtual touch joystick (`virtual_joystick.gd`)[cite: 1].
* **UI & State Menus:** Title screen navigation (`main_menu.tscn`), HUD hearts display, and in-game pause overlays (`pause.gd`)[cite: 1].

---

## Tech Stack

| Component | Specification |
| :--- | :--- |
| **Engine** | Godot Engine 4.x[cite: 1] |
| **Scripting Language** | GDScript[cite: 1] |
| **Render Driver** | Compatibility / GLES3[cite: 1] |
| **Tile Resolution** | 16x16 Pixel Grid (`Terrain (16x16).png`)[cite: 1] |
| **Sprite Resolution** | 32x32 Character Animations[cite: 1] |
| **Audio Format** | MP3 (`mii-channel-music.mp3`)[cite: 1] |

---

## Controls

### Desktop (Keyboard)

| Action | Primary Key | Secondary Key |
| :--- | :--- | :--- |
| **Move Left** | `A`[cite: 1] | `Left Arrow`[cite: 1] |
| **Move Right** | `D`[cite: 1] | `Right Arrow`[cite: 1] |
| **Jump / Double Jump** | `Space`[cite: 1] | `W` / `Up Arrow`[cite: 1] |
| **Pause Game** | `Escape`[cite: 1] | `P`[cite: 1] |

### Mobile (Touch)

* **Virtual Joystick:** On-screen thumbstick anchored to the bottom-left corner for horizontal running[cite: 1].
* **Touch Action Buttons:** Dedicated on-screen touch buttons for jumping and menu choices[cite: 1].

---

## Project Structure

```text
2d-platformer/
├── assets/
│   ├── background/            # Parallax/tiling backgrounds (Brown, Green, Yellow)
│   ├── character/             # 32x32 player sprite sheets (Idle, Run, Jump, Fall, Hit)
│   ├── game_elements/         # Cherries, flags, heart icons, and Mushroom enemies
│   ├── menu/                  # Menu title banners and button textures
│   ├── music/                 # Background audio streams
│   └── terrain/               # 16x16 autotile rules and terrain tilesets
├── scenes/
│   ├── game_objects/          # Player, enemy, collectible, and manager scenes/scripts
│   ├── levels/                # Level1, Level2, moving platforms, pause UI, and joystick
│   └── menu/                  # Main menu scene and menu controller script
├── export_presets.cfg         # Platform export presets
└── project.godot              # Godot 4 project configuration file
```
[cite: 1]

---

## Architecture Overview

* **`scenes/game_objects/main_character.gd`:** Manages kinematic character physics, gravity acceleration, jump tolerances, damage responses, and sprite state transitions[cite: 1].
* **`scenes/game_objects/game_manager.gd`:** Global manager tracking active player hearts, cherry counts, and game reset triggers[cite: 1].
* **`scenes/game_objects/rigid_body_2d_(mush_enemy).gd`:** Controls enemy patrol trajectories, wall rebound handling, and stomp defeat logic[cite: 1].
* **`scenes/game_objects/fall_area.gd`:** Boundary trigger located beneath stage gaps to reload scenes upon player fall-through[cite: 1].
* **`scenes/game_objects/finish.gd`:** Collision trigger processing level-clear transitions to the next stage[cite: 1].
* **`scenes/levels/virtual_joystick.gd`:** Maps touch inputs and drag vectors into standard input actions for mobile devices[cite: 1].
* **`scenes/levels/pause.gd`:** Toggles scene tree pausing and UI modal visibility[cite: 1].

---

## Getting Started

### Prerequisites

* [Godot Engine 4.x](https://godotengine.org/download) (Standard 64-bit edition)[cite: 1].

### Installation & Launch

1. Clone this repository[cite: 1]:
   ```bash
   git clone [https://github.com/](https://github.com/)<your-username>/<repo-name>.git
   cd <repo-name>/2d-platformer
   ```
2. Open the **Godot Project Manager**[cite: 1].
3. Click **Import**, browse to the cloned directory, select `project.godot`, and click **Import & Edit**[cite: 1].
4. Press **F5** (or click the **Play** icon in the upper-right toolbar) to run the game from `main_menu.tscn`[cite: 1].

---

## Credits & Attribution

* **Game Engine:** [Godot Engine](https://godotengine.org/)[cite: 1].
* **Visual Assets:** 2D sprites, tilesets, and animations adapted from Pixel Frog's *Pixel Adventure* pack[cite: 1].
* **Audio:** Background track (`mii-channel-music.mp3`)[cite: 1].

---

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
