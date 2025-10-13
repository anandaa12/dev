return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black", "ruff_fix" }, -- isort first, then black (recommended order)
      go = { "goimports", "gofmt" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    },
    formatters = {
      black = {
        prepend_args = {
          "--line-length=88",
          "--target-version=py311", -- adjust to your Python version
        },
      },
      isort = {
        prepend_args = {
          "--profile=black", -- ensures compatibility with black
          "--line-length=88",
          "--multi-line=3",
          "--trailing-comma",
          "--force-grid-wrap=0",
          "--use-parentheses",
          "--ensure-newline-before-comments",
        },
      },
    },
    -- Set up format-on-save
    -- format_on_save = { timeout_ms = 500 },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
  init = function()
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      local ft = vim.bo.filetype
      local opts = {
        async = true,
        range = range,
      }
      if ft == "python" then
        opts.formatters = { "isort", "black", "ruff_fix" }
        opts.lsp_fallback = false
      else
        opts.lsp_format = "fallback"
      end
      require("conform").format(opts)
    end, { range = true })
    
    vim.keymap.set({ "n", "v" }, "<A-f>", "<cmd>Format<cr>", { 
      desc = "Format code (Conform)", 
      silent = true 
    })
  end
}
