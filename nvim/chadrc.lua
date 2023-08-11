---@type ChadrcConfig 
local M = {}

M.mappings = require "custom.mappings"

M.ui = {
  theme = 'yoru',
  transparency = true,
  statusline = {
    -- modules arg here is the default table of modules
    overriden_modules = function(modules)
      modules[2] = (function()
      local st_modules = require "nvchad.statusline.default"
          local sep_r = "█"
          return "%#St_file_info#" .. vim.fn.expand "%:h" .. "%#St_file_sep#" .. sep_r .. st_modules.fileInfo()
      end)()
    end,
  },
    --   -- this is just default table of statusline modules
    --
    --   return {
    --     fileInfo = function()
    --       local sep_r = "█"
    --       return "%#St_file_info#" .. vim.fn.expand "%:h" .. "%#St_file_sep#" .. sep_r .. st_modules.fileInfo()
    --     end,
    --   }
    -- end,
  -- },

  changed_themes = {
      yoru = {
         base_16 = {
            base02 = "#3c3c3c",
         },
    }
  },
}
M.plugins = "custom.plugins"
return M
