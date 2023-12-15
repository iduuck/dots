return {
  -- Mighty tpope
  { 'tpope/vim-bundler' },
  { 'tpope/vim-eunuch' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-dispatch' },

  -- Git integration
  { 'lewis6991/gitsigns.nvim' },
  -- For neogit configuration, see the neogit.lua file.
  -- { 'TimUntersberger/neogit' },

  -- Utils
  { "rcarriga/nvim-notify" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "djoshea/vim-autoread" },
  { 'andymass/vim-matchup' },
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
  { 'echasnovski/mini.ai' },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonLog" }
  },

  -- LSP things
  { "williamboman/mason-lspconfig.nvim" },
  { "lukas-reineke/lsp-format.nvim" },
  { 'glepnir/lspsaga.nvim' },
  { 'onsails/lspkind.nvim' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { "neovim/nvim-lspconfig" },
  {
    "b0o/SchemaStore.nvim",
    module = "schemastore"
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },

  -- Language support
  { 'jxnblk/vim-mdx-js' },
  { 'tomlion/vim-solidity' },
  { 'jparise/vim-graphql' },
  { 'pantharshit00/vim-prisma' },
  { 'github/copilot.vim' },


  -- UI
  { 'nvim-lua/plenary.nvim' },
}
