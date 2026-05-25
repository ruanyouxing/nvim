# AGENTS.md

## Entrypoint & Structure

- Init: `lua/core/init.lua` — requires options, events, pack (lazy), keymaps, sets colorscheme.
- Plugin specs: `lua/modules/{editor,tools,ui,lang}/` — each file returns a lazy.nvim spec (one plugin per file, or a list).
- LSP configs: `after/lsp/<server>.lua` — auto-loaded by `lua/core/lsp.lua`.
- Treesitter queries: `after/queries/<lang>/highlights.scm`.

## Plugin Manager

`folke/lazy.nvim` via `lua/core/pack.lua`. Dev path from `mnw.configDir`.

## Keybindings

- Leader: `<Space>` (set in `init.lua`).
- Central command menu: `<C-S-p>` triggers `require('core.menu')`.
- Trouble diagnostics toggle: `<leader>T`.
- Update plugins: `<leader>p` → `Lazy update`.
- Format: `<leader>f` (conform.nvim).

## LSP

- All servers defined in `after/lsp/*.lua` return a `vim.lsp.config`-compatible table.
- blink.cmp provides LSP capabilities automatically via `blink.get_lsp_capabilities()`.
- No `mason.nvim` in use — LSP servers come from system PATH (Nix flake).

## Formatting

- **StyLua**: `stylua.toml` — 2 spaces, single quotes, call_parentheses=None, column_width=120.
- **clang-format**: uses `.clang_format` at repo root.
- **Formatters by filetype** (conform.nvim): `stylua` (lua), `clang-format` (c,cpp), `alejandra` (nix), `prettier` (js,ts,json,html,css,md,yaml).

## Nix Build

- `nix develop` / `nix build` via `flake.nix` (uses `mnw` to wrap neovim).
- Dependencies listed in `nix/dependencies.nix` (includes LSP servers, formatters, tools).
- Treesitter grammars compiled in `nix/plugins.nix`.

## Environment

- `NVIM_APPNAME=ruanyouxing/nvim/ nvim` to launch with this config (per README).
- Lazy sync: `NVIM_APPNAME=ruanyouxing/nvim/ nvim --headless +"Lazy! sync" +qa`.
- `mnw.configDir` is a global provided by the Nix wrapper, pointing to the config root.
