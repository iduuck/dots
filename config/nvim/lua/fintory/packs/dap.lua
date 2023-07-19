return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "theHamsta/nvim-dap-virtual-text",
    "mxsdev/nvim-dap-vscode-js",
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "nvim-dap" },
      cmd = { "DapInstall", "DapUninstall" },
      opts = { ensure_installed = {} },
    },
    {
      "rcarriga/nvim-dap-ui",
      opts = { floating = { border = "rounded" } },
      config = require('fintory.dap.configs.nvim-dap-ui'),
    },
    {
      "rcarriga/cmp-dap",
      dependencies = { "nvim-cmp" },
      config = require('fintory.dap.configs.cmp-dap'),
    },
  },
  config = function()
    require("fintory.dap")
  end,
}
