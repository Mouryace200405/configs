local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- Orange Fog color palette
local colors = {
    fg = "#e0d8b0",
    bg = "#1a1a1a",
    comment = "#7f7f7f",
    red = "#ff6c6b",
    green = "#98c379",
    yellow = "#e5c07b",
    blue = "#61afef",
    magenta = "#c678dd",
    cyan = "#56b6c2",
    orange = "#ff9e64",
    selection = "#3e4451",
    caret = "#ff9e64",
    invisibles = "#3b4048"
}

-- Define your shells/profiles
local shells = {
    { name = "PowerShell (Built-in)", cmd = { "powershell.exe", "-NoExit" } },
    { name = "Command Prompt",        cmd = { "cmd.exe" } },
    { name = "WSL (Debian)",          cmd = { "wsl.exe", "-d", "Debian" } },
    { name = "Git Bash",              cmd = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login" } },
}

-- Set the default profile to built-in PowerShell
config.default_prog = shells[1].cmd

-- Enable the launcher menu for new tabs (right-click on "+" button)
config.launch_menu = {}
for _, shell in ipairs(shells) do
    table.insert(config.launch_menu, {
        label = shell.name,
        args = shell.cmd,
    })
end

-- Fix exit behavior for all domains
config.exit_behavior = "Hold"

-- Keybindings
config.keys = {
    -- Split panes
    { mods = "ALT",        key = ".",          action = act.SplitPane { direction = "Right", size = { Percent = 30 } } },
    { mods = "ALT",        key = "/",          action = act.SplitPane { direction = "Down", size = { Percent = 30 } } },

    -- Close pane
    { mods = "ALT",        key = "w",          action = act.CloseCurrentPane { confirm = true } },

    -- Pane navigation
    { mods = "ALT",        key = "LeftArrow",  action = act.ActivatePaneDirection 'Prev' },
    { mods = "ALT",        key = "RightArrow", action = act.ActivatePaneDirection 'Next' },
    { mods = "ALT",        key = "UpArrow",    action = act.ActivatePaneDirection 'Up' },
    { mods = "ALT",        key = "DownArrow",  action = act.ActivatePaneDirection 'Down' },

    -- Font size
    { mods = "ALT",        key = "+",          action = act.IncreaseFontSize },
    { mods = "ALT",        key = "-",          action = act.DecreaseFontSize },
    { mods = "ALT",        key = "*",          action = act.ResetFontSize },

    -- Copy/Paste
    { mods = "ALT",        key = "c",          action = act.CopyTo 'ClipboardAndPrimarySelection' },
    { mods = "ALT",        key = "v",          action = act.PasteFrom 'Clipboard' },

    -- Tab cycling
    { mods = "CTRL",       key = "Tab",        action = act.ActivateTabRelative(1) },
    { mods = "CTRL|SHIFT", key = "Tab",        action = act.ActivateTabRelative(-1) },

    -- Open specific shells with Ctrl+Alt+[Number]
    { mods = "CTRL|ALT",   key = "1",          action = act.SpawnCommandInNewTab({ args = shells[1].cmd }) },
    { mods = "CTRL|ALT",   key = "2",          action = act.SpawnCommandInNewTab({ args = shells[2].cmd }) },
    { mods = "CTRL|ALT",   key = "3",          action = act.SpawnCommandInNewTab({ args = shells[3].cmd }) },
    { mods = "CTRL|ALT",   key = "4",          action = act.SpawnCommandInNewTab({ args = shells[4].cmd }) },
}

-- Tab navigation (ALT+1-8)
for i = 0, 7 do
    table.insert(config.keys, { mods = "ALT", key = tostring(i + 1), action = act.ActivateTab(i) })
end

-- Tab movement (CTRL+ALT)
for _, v in ipairs({
    { "LeftArrow",  act.MoveTabRelative(-1) },
    { "RightArrow", act.MoveTabRelative(1) }
}) do
    table.insert(config.keys, { mods = "CTRL|ALT", key = v[1], action = v[2] })
end

-- Font configuration
config.font = wezterm.font_with_fallback({
    { family = 'JetBrains Mono',          weight = 'Regular' },
    { family = 'FiraCode Nerd Font Mono', weight = 'Regular' },
    { family = 'Symbols Nerd Font Mono',  weight = 'Regular' }
})
config.font_size = 16
config.line_height = 1.1
config.window_frame = {
    font = wezterm.font { family = 'FiraCode Nerd Font Mono', weight = 'Regular' },
    font_size = 12.0,
    active_titlebar_bg = colors.bg
}

-- Performance settings
config.max_fps = 120
config.animation_fps = 1
config.window_background_opacity = 0.60
config.enable_scroll_bar = false
config.use_fancy_tab_bar = true
config.term = "xterm-256color"
config.warn_about_missing_glyphs = false
config.enable_wayland = false
config.front_end = "OpenGL"
config.webgpu_power_preference = "HighPerformance"
config.prefer_egl = true

-- Color scheme (Orange Fog)
config.colors = {
    foreground = colors.fg,
    background = colors.bg,
    cursor_bg = colors.orange,
    cursor_fg = colors.bg,
    cursor_border = colors.orange,
    selection_fg = colors.fg,
    selection_bg = colors.selection,
    scrollbar_thumb = colors.invisibles,
    split = colors.invisibles,
    ansi = { colors.invisibles, colors.red, colors.green, colors.yellow, colors.orange, colors.magenta, colors.cyan, colors.fg },
    brights = { colors.comment, "#ff9790", "#6af28c", "#e3b341", colors.orange, "#d2a8ff", "#56d4dd", "#ffffff" },
    tab_bar = {
        background = colors.bg,
        inactive_tab_edge = colors.invisibles,
        active_tab = { bg_color = colors.orange, fg_color = colors.bg, intensity = "Bold" },
        inactive_tab = { bg_color = colors.bg, fg_color = colors.comment },
        inactive_tab_hover = { bg_color = "#3b4048", fg_color = colors.orange },
        new_tab = { bg_color = colors.bg, fg_color = colors.orange, intensity = "Bold" },
        new_tab_hover = { bg_color = "#3b4048", fg_color = colors.red }
    }
}

-- Mouse bindings
config.mouse_bindings = {
    { event = { Down = { streak = 1, button = "Right" } }, mods = "NONE", action = act.CopyTo("Clipboard") },
    { event = { Down = { streak = 1, button = "Middle" } }, mods = "NONE", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { event = { Down = { streak = 1, button = "Middle" } }, mods = "SHIFT", action = act.CloseCurrentPane { confirm = false } }
}

return config
