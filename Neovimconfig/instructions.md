# Neovim Keybindings Explained

This file documents all custom keybindings defined in your `init.lua` configuration.

---

## General Keymaps
- `<leader>w` — Save file
- `<leader>q` — Quit Neovim
- `<leader>x` — Save and quit
- `<Esc>` — Clear search highlighting

## Window Navigation
- `<C-h>` — Move to left window
- `<C-j>` — Move to bottom window
- `<C-k>` — Move to top window
- `<C-l>` — Move to right window

## Window Resizing
- `<C-Up>` — Increase window height
- `<C-Down>` — Decrease window height
- `<C-Left>` — Decrease window width
- `<C-Right>` — Increase window width

## Buffer Navigation
- `<Tab>` — Next buffer
- `<S-Tab>` — Previous buffer
- `<leader>bd` — Delete buffer

## File Explorer (Neo-tree)
- `<leader>e` — Toggle file explorer
- `<leader>o` — Focus file explorer

## Fuzzy Finder (Telescope)
- `<leader>ff` — Find files
- `<leader>fg` — Live grep
- `<leader>fb` — Find buffers
- `<leader>fh` — Help tags
- `<leader>fs` — Grep string under cursor

## LSP (Language Server Protocol)
- `gd` — Go to definition
- `gD` — Go to declaration
- `gr` — Go to references
- `gi` — Go to implementation
- `K` — Hover documentation
- `<leader>k` — Signature help
- `<leader>rn` — Rename symbol
- `<leader>ca` — Code action
- `<leader>f` — Format buffer

## Diagnostics
- `[d` — Previous diagnostic
- `]d` — Next diagnostic
- `<leader>d` — Show diagnostic

## Git Integration
- `<leader>gs` — Git status
- `<leader>gc` — Git commit
- `<leader>gp` — Git push
- `<leader>gl` — Git log

## Terminal
- `<leader>tt` — Toggle terminal
- `<leader>ts` — Open terminal (horizontal split)
- `<leader>tv` — Open vertical terminal
- `<leader>tf` — Open floating terminal

### Terminal Size
- Horizontal terminals open at the bottom and only occupy part of the screen (not full screen).
- You can resize the terminal with standard Neovim window commands (e.g., `<C-Up>`, `<C-Down>`).

### Clearing the Terminal
- In Neovim's terminal, the `clear` command may not always work as expected due to shell or terminal emulator limitations.
- If `clear` does not work, try using `<C-l>` (Ctrl+L) inside the terminal, which often refreshes the screen.
- Alternatively, close and reopen the terminal with `<leader>tt` or the other terminal keybindings.

## Indenting (Visual Mode)
- `<` — Indent left
- `>` — Indent right

## Move Text (Visual Mode)
- `J` — Move text down
- `K` — Move text up

## Troubleshooting Icons and Terminal


## Updating Plugins and Troubleshooting Icons

### Updating Plugins
- To update all plugins, use the command `:Lazy update` in Neovim.
- For Neo-tree and devicons, you can also run `:TSUpdate` for Treesitter parsers and `:checkhealth` to diagnose issues.

### Troubleshooting Icons
- If icons do not display:
	1. Make sure your terminal font is set to the correct Nerd Font (e.g., JetBrainsMono Nerd Font Regular).
	2. Update the `nvim-web-devicons` plugin with `:Lazy update`.
	3. Restart Neovim and your terminal.
	4. Run `:checkhealth` in Neovim to check for plugin or font issues.
	5. Try another Nerd Font if issues persist.
---
**Note:** `<leader>` is set to the spacebar (` `).

For more details, see your `init.lua` file.
