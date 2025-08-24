WezTerm Configuration - Orange Fog Theme
This repository contains a WezTerm configuration that provides a customized Orange Fog color palette, improved keybindings, multiple shell launch options, and enhanced performance settings.

✨ Features
🎨 Orange Fog Color Palette
Customized dark theme with warm orange accents.

High-contrast ANSI colors for better readability.

Styled tab bar with active/inactive/hover states.

Semi-transparent (60%) terminal background.

🔧 Shell Profiles
Multiple shells are configured for quick access:

PowerShell (default)

Command Prompt

WSL (Debian)

Git Bash

You can launch these from the launcher menu (right-click +) or with keyboard shortcuts.

⌨️ Keybindings
🔄 Pane Management
Split Pane Right → Alt + .

Split Pane Down → Alt + /

Close Pane → Alt + W

Navigate Panes → Alt + Arrow Keys

🔠 Font Size Control
Increase Font Size → Alt + +

Decrease Font Size → Alt + -

Reset Font Size → Alt + *

📋 Copy & Paste
Copy to Clipboard → Alt + C

Paste from Clipboard → Alt + V

🗂 Tab Management
Switch Tabs (Forward) → Ctrl + Tab

Switch Tabs (Backward) → Ctrl + Shift + Tab

Go to Tab (1–8) → Alt + [1-8]

Move Tab Left → Ctrl + Alt + Left

Move Tab Right → Ctrl + Alt + Right

⚡ Quick Shell Launch Shortcuts
PowerShell → Ctrl + Alt + 1

Command Prompt → Ctrl + Alt + 2

WSL (Debian) → Ctrl + Alt + 3

Git Bash → Ctrl + Alt + 4

🖱 Mouse Bindings
Right Click → Copy to clipboard

Middle Click → Split horizontally

Shift + Middle Click → Close current pane

🖋 Fonts
Uses a fallback chain to ensure missing glyphs are rendered properly:

JetBrains Mono (primary)

FiraCode Nerd Font

Symbols Nerd Font

Font size: 16pt, with slight line height adjustment for readability.

⚡ Performance Settings
120 FPS rendering for smooth animations.

OpenGL backend with preference for EGL.

Wayland disabled for more compatibility.

WebGPU high-performance mode enabled.

Reduced animation FPS for less CPU usage (animation_fps = 1).

📦 Additional Settings
exit_behavior = "Hold" → Keeps the terminal open after process exit.

No scroll bar (clean interface).

Xterm-256color terminal type.

Suppressed missing glyph warnings.

Fancy tab bar enabled.

🚀 How to Use
Copy this wezterm.lua config into your WezTerm config directory:

Windows: C:\Users\<YourUser>\.wezterm.lua

Linux/macOS: ~/.wezterm.lua

Launch WezTerm.

Use the configured shortcuts, tabs, and shell menu to get started!

-------

+-------------------------------------------------------------+
|                   WezTerm Keybindings Cheat Sheet           |
+-------------------------------------------------------------+
| Pane Management:                                             |
|    Alt + .     → Split Pane Right (30%)                     |
|    Alt + /     → Split Pane Down (30%)                      |
|    Alt + w     → Close Current Pane (Confirm)               |
|    Alt + ←↑→↓  → Navigate Panes (Left, Up, Right, Down)     |
+-------------------------------------------------------------+
| Font Size:                                                  |
|    Alt + +     → Increase Font Size                         |
|    Alt + -     → Decrease Font Size                         |
|    Alt + *     → Reset Font Size                            |
+-------------------------------------------------------------+
| Copy & Paste:                                               |
|    Alt + c     → Copy to Clipboard & Primary Selection     |
|    Alt + v     → Paste from Clipboard                       |
+-------------------------------------------------------------+
| Tab Navigation:                                             |
|    Ctrl + Tab        → Next Tab                             |
|    Ctrl + Shift + Tab→ Previous Tab                         |
|    Alt + [1..8]      → Activate Tab 1 to 8                  |
|    Ctrl + Alt + ←/→  → Move Tab Left / Right                |
+-------------------------------------------------------------+
| Quick Shell Launch:                                         |
|    Ctrl + Alt + 1 → PowerShell                              |
|    Ctrl + Alt + 2 → Command Prompt                          |
|    Ctrl + Alt + 3 → WSL Debian                              |
|    Ctrl + Alt + 4 → Git Bash                                |
+-------------------------------------------------------------+
| Mouse Shortcuts:                                            |
|    Right Click       → Copy to Clipboard                    |
|    Middle Click      → Split Pane Horizontally              |
|    Shift + Middle    → Close Current Pane                   |
+-------------------------------------------------------------+
