return {
  "nvim-neotest/neotest",
  dependencies = { "marilari88/neotest-vitest" },
  opts = {
    adapters = {
      "neotest-vitest",
      ["neotest-python"] = {
        -- Here you can specify the settings for the adapter, i.e.
        runner = "pytest",
        python = ".venv/bin/python",
      },
    },
  },
}
