-- You need to install from source first:
--
-- ```
-- git clone https://github.com/microsoft/vscode-js-debug ~/.nvim-dap/vscode-js-debug --depth=1
-- cd ~/.nvim-dap/vscode-js-debug
-- npm install --legacy-peer-deps
-- npm run compile
-- ```

local ok_dap, dap = pcall(require, "dap")
local ok_dapui, dapui = pcall(require, "dapui")
local ok_dap_virtual_text, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
local ok_dap_vscode_js, dap_vscode_js = pcall(require, "dap-vscode-js")

if not (ok_dap and ok_dapui and ok_dap_virtual_text and ok_dap_vscode_js) then
  require('notify')("DAP not loaded: ", vim.log.levels.ERROR)
  return
end

local dap_utils = require("dap.utils")

dap_vscode_js.setup({
  node_path = "node",
  debugger_path = os.getenv("HOME") .. "/.nvim-dap/vscode-js-debug",
  adapters = { "pwa-node", "pwa-chrome", "node-terminal" },
})

local languages = {
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
}

for _, language in ipairs(languages) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File (pwa-node)",
      cwd = vim.fn.getcwd(),
      args = { "${file}" },
      sourceMaps = true,
      protocol = "inspector",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File (pwa-node with ts-node)",
      cwd = vim.fn.getcwd(),
      runtimeArgs = { "--loader", "ts-node/esm" },
      runtimeExecutable = "node",
      args = { "${file}" },
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Test Current File (pwa-node with jest)",
      cwd = vim.fn.getcwd(),
      runtimeArgs = { "${workspaceFolder}/node_modules/.bin/jest" },
      runtimeExecutable = "node",
      args = { "${file}", "--coverage", "false" },
      rootPath = "${workspaceFolder}",
      sourceMaps = true,
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Test Current File (pwa-node with vitest)",
      cwd = vim.fn.getcwd(),
      program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
      args = { "--inspect-brk", "--threads", "false", "run", "${file}" },
      autoAttachChildProcesses = true,
      smartStep = true,
      console = "integratedTerminal",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    {
      type = "pwa-chrome",
      request = "attach",
      name = "Attach Program (pwa-chrome, select port)",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      port = function()
        return vim.fn.input("Select port: ", 3000)
      end,
      webRoot = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach Program (pwa-node, select pid)",
      cwd = vim.fn.getcwd(),
      processId = dap_utils.pick_process,
      skipFiles = { "<node_internals>/**" },
    },
  }
end

dap_virtual_text.setup({
  enabled = true,
  enabled_commands = true,
  highlight_changed_variables = true,
})

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = true,
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        { id = "repl", size = 0.5 },
        { id = "console", size = 0.5 },
      },
      size = 10,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  }
})

vim.keymap.set("n", "<Leader>di", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>dI", ":lua require(\"dap\").set_breakpoint(vim.fn.input(\"Breakpoint condition: \"))<CR>")
vim.keymap.set("n", "<Leader>dp", ":lua require(\"dap\").set_breakpoint(nil, nil, vim.fn.input(\"Log point message: \"))<CR>")
vim.keymap.set("n", "<Leader>ds", ":lua require(\"dap\").continue()<CR>")
vim.keymap.set("n", "<Leader>dl", ":lua require(\"dap\").run_to_cursor()<CR>")
vim.keymap.set("n", "<Leader>dS", ":lua require(\"dap\").disconnect()<CR>")
vim.keymap.set("n", "<Leader>dn", ":lua require(\"dap\").step_over()<CR>")
vim.keymap.set("n", "<Leader>dN", ":lua require(\"dap\").step_into()<CR>")
vim.keymap.set("n", "<Leader>do", ":lua require(\"dap\").step_out()<CR>")
vim.keymap.set("n", "<Leader>dww", ":lua require(\"dapui\").toggle()<CR>")
vim.keymap.set("n", "<Leader>dw[", ":lua require(\"dapui\").toggle(1)<CR>")
vim.keymap.set("n", "<Leader>dw]", ":lua require(\"dapui\").toggle(2)<CR>")
