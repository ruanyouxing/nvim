return {
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', '.git' },
  cmd = { 'nixd' },
  settings = {
    nixd = {
      formatting = {
        command = { 'alejandra' },
      },
    },
  },
}
