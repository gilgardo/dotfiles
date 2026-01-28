-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false

-- Keep 8 lines of context visible above/below cursor when scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Enable inlay hints by default (shows "ghost" types inline for TypeScript)
vim.lsp.inlay_hint.enable(true)

-- Clipboard configuration
-- Use wl-copy/wl-paste for Wayland, fallback to OSC 52 for containers/SSH
if vim.fn.executable("wl-copy") == 1 and os.getenv("WAYLAND_DISPLAY") then
  vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
      ["+"] = "wl-copy --type text/plain",
      ["*"] = "wl-copy --primary --type text/plain",
    },
    paste = {
      ["+"] = "wl-paste --no-newline",
      ["*"] = "wl-paste --no-newline --primary",
    },
    cache_enabled = 0,
  }
else
  -- OSC52 fallback for containers, SSH, tmux
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end

-- Sync yank with system clipboard (unnamedplus = "+", unnamed = "*")
vim.opt.clipboard = "unnamedplus"
