return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      hidden = true,
      ignored = true,
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)
    local gitbrowse = require("snacks.gitbrowse")
    local old_get_url = gitbrowse.get_url
    gitbrowse.get_url = function(repo, fields, gopts)
      local url = old_get_url(repo, fields, gopts)
      if url then
        Snacks.notify.info("Git URL generated: " .. url)
      end
      return url
    end
  end,
}
