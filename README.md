<p align="center">
  <img src="images/logo.svg" width="500" alt="DNGUGotE3 Logo">
</p>

### DA NAPKIN GOD ULTIMATE GAME of the EON III (DNGUGotE3)

Welcome to **DNGUGotE3**, a turn-based fighting game built entirely in **Batch**, **VBScript**, and **AutoHotkey**.

This project includes a custom launcher, a unique file format for your game saves, a card visualizer to show off your save files to others, and a registry script to integrate your custom file format with Windows.

<p align="center">
  <a href="https://magnado.itch.io/dngg" target="_blank">
    <b>Get DNGUGotE3 on itch.io</b>
  </a>
</p>
[![Built for ReactOS](https://img.shields.io/badge/-Built%20for%20ReactOS-0088CC?logo=reactos)](https://reactos.org)

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

## ReactOS Compatibility
**DNGUGotE3** is proudly developed with native compatibility for **ReactOS**. While it also functions on modern Windows, the game’s architecture was specifically designed to run within the ReactOS environment, utilizing standard Batch, VBScript, and AutoHotkey implementations that align with the ReactOS project's goals.

## Key Features
* **Custom Save System:** A unique file format designed specifically for DNGUGotE3.
* **Card Visualizer:** Easily show off your progress and characters to other players.
* **Retro-Inspired Launcher:** A lightweight, custom-built interface to manage your game sessions.
* **Open Source:** Full transparency—check the code to see how the logic works under the hood.
* The game is just the `DNGUGotE3.bat` file, you dont need any other files included to play!

## Troubleshooting
* **Antivirus False Positives:** Because this project uses Batch and AHK scripts for automation, some antivirus software may flag it as suspicious. This is a common false positive for open-source scripts; you can verify the code yourself by reviewing the files in this repository.
* **Setup Issues:** If the game fails to launch after moving files, simply re-run `setup.bat` to reset your paths.

## License
This project is provided for educational and entertainment purposes. Please do not re-distribute without permission.

## Known Issues
* **Windows Compatibility:** The **Card Visualizer** character display currently has a rendering issue on Windows. While the feature is fully functional and stable on **ReactOS**, it may not display correctly on modern Windows versions. This is currently under investigation.
