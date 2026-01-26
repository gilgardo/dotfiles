-- Next.js / React / TypeScript / Tailwind development support
return {
  -- TypeScript support via LazyVim extra (includes vtsls LSP)
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- Tailwind CSS support (autocomplete, color preview, class sorting)
  { import = "lazyvim.plugins.extras.lang.tailwind" },

  -- JSON support (for package.json, tsconfig.json, etc.)
  { import = "lazyvim.plugins.extras.lang.json" },

  -- Additional treesitter parsers for Next.js
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
        "javascript",
        "html",
        "css",
        "json",
        "markdown",
        "markdown_inline",
      })
    end,
  },

  -- Mason: ensure LSP servers and formatters are installed
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- TypeScript/JavaScript
        "typescript-language-server",
        "eslint-lsp",
        "prettierd",
        -- Tailwind
        "tailwindcss-language-server",
        -- CSS
        "css-lsp",
      },
    },
  },

  -- Configure formatters
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        markdown = { "prettierd" },
      },
    },
  },

  -- Configure linters
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = { "eslint" },
        javascriptreact = { "eslint" },
        typescript = { "eslint" },
        typescriptreact = { "eslint" },
      },
    },
  },
}
