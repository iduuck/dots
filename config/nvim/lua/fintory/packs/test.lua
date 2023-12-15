return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    'marilari88/neotest-vitest',
  },
  config = function()
    local util = require('neotest-vitest.util')

    local find_workspace_ancestor = function(startpath)
      return util.search_ancestors(startpath, function(path)
        if util.path.is_dir(util.path.join(path, "pnpm-workspace.yaml")) then
          return path
        end
      end)
    end

    require('neotest').setup({
      adapters = {
        require('neotest-vitest')({
          vitestCommand = function(path)
            local rootPath = find_workspace_ancestor(path)
            local vitestBinary = util.path.join(rootPath, "node_modules", ".bin", "vitest")

            if util.path.exists(vitestBinary) then
              return vitestBinary
            end

            return "vitest"
          end,
        }),
      },
    })

    vim.keymap.set("n", "<Leader>tt", require('neotest').run.run)
  end
}
