# DA NAPKIN GOD ULTIMATE GAME of the EON III (DNGUGotE3)

Welcome to **DNGUGotE3**, a turn-based fighting game built entirely in **Batch**, **VBScript**, and **AutoHotkey**.

This project includes a custom launcher, a unique file format for your game saves, a card visualizer to show off your save files to others, and a registry script to integrate your custom file format with Windows.

---

## How to Start

### First-time Launch
1. Double-click `setup.bat` in the root folder.
2. Wait for the installation to complete.
3. Use the generated desktop shortcut, or navigate to `/game-files/` and run `open-l.vbs`.

### Returning Players
* Run `open-l.vbs` from the `/game-files/` directory, or use your desktop shortcut to access the launcher.

### Moved the game files?
* Please re-run `setup.bat` to update the file paths.

---

## Project Structure

| Directory | Description |
| :--- | :--- |
| `/game-files/` | Core game logic and executables. |
| `/game-files/icons/` | Game and file type icons (`holytext.ico`, `dngugote3.ico`). |
| `/game-files/saves/` | Your personal save files. |
| `/game-files/other/` | Utility scripts, including the registry configuration. |

---

## Security & Transparency
Because this game uses system-level scripting languages for its launcher and save systems, I have provided the full source code here on GitHub. You are encouraged to inspect the code to ensure it meets your security standards before running it.
