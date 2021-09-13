local ts = require("telescope")
local actions = require("telescope.actions")

-- Do the plain setup for Telescope
ts.setup({
  defaults = {
    prompt_prefix = ' >'
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
})

-- Load Extsions for Telescope
ts.load_extension("fzy_native")

-- Extend telescope with own functionality
local M = {}

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map("i", "<c-d>", actions.git_delete_branch)
            map("n", "<c-d>", actions.git_delete_branch)

            map("i", "<c-r>", actions.git_rebase_branch)
            map("n", "<c-r>", actions.git_rebase_branch)

            return true
        end,
    })
  end

return M
