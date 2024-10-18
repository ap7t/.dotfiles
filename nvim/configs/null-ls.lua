local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    -- null_ls.builtins.formatting.golines,
    null_ls.builtins.diagnostics.mypy.with({
      extra_args = function()
      local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
      return {
          "--python-executable", virtual .. "/bin/python3" ,
          "--ignore-missing-imports",
        }
      end,

    }),
    null_ls.builtins.formatting.black.with({
      extra_args = {
        "--skip-string-normalization",
        "--line-length", "120",
      },
    }),
  },
  on_attach = function(client, bufnr)
      -- Function to format only the changed lines in the file
      local function format_changed_lines()
        -- Use gitsigns to get changed hunks (if you want Git-based changed lines)
        local gs = package.loaded.gitsigns
        if gs then
          local hunks = gs.get_hunks(bufnr)
          if hunks then
            for _, hunk in ipairs(hunks) do
              local start_line = hunk.added.start
              local end_line = hunk.added.start + hunk.added.count
              vim.lsp.buf.format({
                range = {
                  start = { start_line - 1, 0 }, -- Convert to 0-based indexing
                  ["end"] = { end_line - 1, 0 }
                },
                bufnr = bufnr,
              })
            end
          else 
          end
        else
          -- Fallback: format the whole file if gitsigns isn't available
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      end

      if client.supports_method("textDocument/formatting") then 
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            if vim.bo.filetype == "python" then
              format_changed_lines()
            else
              vim.lsp.buf.format({ bufnr = bufnr })
            end
          end
        })
      end
    end
}
return opts
