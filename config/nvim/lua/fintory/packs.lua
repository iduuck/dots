local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local present, packer = pcall(require, 'packer')

if not present then
   print "Cloning packer.."
   -- remove the dir before cloning
   vim.fn.system {
      "git",
      "clone",
      "https://github.com/wbthomason/packer.nvim",
      "--depth",
      "20",
      packer_path,
   }

   vim.cmd "packadd packer.nvim"
   present, packer = pcall(require, "packer")

   if present then
      print "Packer cloned successfully."
   else
      error("Couldn't clone packer !\nPacker path: " .. packer_path .. "\n" .. packer)
   end
end

return packer.startup(function ()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Notify app
  use "rcarriga/nvim-notify"

  -- tmux and neovim support
  use({
    "aserowy/tmux.nvim",
    config = function() require("tmux").setup() end
  })

  -- Basic plugins without need of 
  use 'tpope/vim-bundler'
  use 'tpope/vim-eunuch'
  use {
    'tpope/vim-fugitive',
    config = function()
      require('fintory.packs.fugitive')
    end
  }
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-dispatch'
  use 'jxnblk/vim-mdx-js'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('fintory.packs.comment')
    end
  }

  -- Multiple packs for better syntax support.
  use 'tomlion/vim-solidity'
  use 'jparise/vim-graphql'
  use 'pantharshit00/vim-prisma'
  -- use 'elixir-editors/vim-elixir'

  -- Easy launching of tests in ruby and javascript
  -- https://github.com/janko-m/vim-test
  use {
    'janko-m/vim-test',
    after = 'vim-dispatch',
    config = function()
      require('fintory.packs.test')
    end
  }

  -- Ag support
  -- https://github.com/mileszs/ack.vim
  use {
    'mileszs/ack.vim',
    config = function()
      require('fintory.packs.ag')
    end
  }

  -- Companion for brackets, for endwise.vim
  -- https://github.com/9mm/vim-closer
  -- use '9mm/vim-closer'
  
  -- Better find a matching keypair in your buffer.
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('fintory.packs.hop')
    end
  }

  -- LSP Installer
  use {
    "williamboman/mason.nvim",
    after = "nvim-lspconfig",
    requires = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require('mason').setup({
        ensure_installed = { "typescript-language-server", "eslint-lsp", "lua-language-server" },
        automatic_installation = true
      })
      require('mason-lspconfig').setup()
    end
  }

  -- LSP configuration made easy
  -- https://github.com/neovim/nvim-lspconfig
  use {
    'neovim/nvim-lspconfig',
    event = 'BufRead',
    config = function()
      require('fintory.packs.lsp')
    end,
    requires = {
      {
        'hrsh7th/cmp-nvim-lsp'
      },
      {
        'hrsh7th/cmp-buffer'
      }
    }
  }

  use "lukas-reineke/lsp-format.nvim"

  -- LUA alternative to lightline.vim
  -- https://github.com/nvim-lualine/lualine.nvim
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    -- after = "github-nvim-theme",
    config = function()
      require('fintory.packs.lualine')
    end
  }

  use "lukas-reineke/indent-blankline.nvim"

  -- Actual cmp implementation
  -- https://github.com/hrsh7th/nvim-cmp
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('fintory.packs.cmp')
    end,
    requires = { 'lspkind.nvim' },
  }

  use 'L3MON4D3/LuaSnip'

  use {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        invert_selection = true,
        italic = true,
      })

      vim.o.background = "dark"
      vim.cmd([[colorscheme gruvbox]])
    end
  }

  -- Matching the opening and closing brackets not just
  -- by symbol, but also by language agnostic words
  -- https://github.com/andymass/vim-matchup
  use 'andymass/vim-matchup'

  -- Lightweight LSP plugin with highly performant UI.
  -- https://github.com/glepnir/lspsaga.nvim
  use 'glepnir/lspsaga.nvim'

  -- Tree-shitter for parsing and syntax features.
  -- https://github.com/nvim-treesitter/nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    after = { 'vim-matchup' },
    config = function()
      require('fintory.packs.treesitter')
    end
  }

  -- Tree for file management
  -- https://github.com/kyazdani42/nvim-tree.lua
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193),
    config = function()
      require('fintory.packs.nvim-tree')
    end
  }

  -- Tree-shitter playground
  -- https://github.com/nvim-treesitter/playground
  use {
    'nvim-treesitter/playground',
    after = { 'nvim-treesitter' }
  }

  -- Some new kind of nice looking dropdown for CMP
  -- https://github.com/onsails/lspkind.nvim
  use 'onsails/lspkind.nvim'

  -- UI stuff for usage of other packs
  -- https://github.com/nvim-lua/plenary.nvim
  use 'nvim-lua/plenary.nvim'

  -- Icons support for themes
  -- https://github.com/kyazdani42/nvim-web-devicons
  use 'kyazdani42/nvim-web-devicons'

  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
  }

  -- Telescope implementation
  -- https://github.com/nvim-telescope/telescope.nvim
  use({ 
    {
      'nvim-telescope/telescope.nvim',
      event = 'CursorHold',
      requires = {
        'nvim-lua/plenary.nvim',
        'JoosepAlviste/nvim-ts-context-commentstring'
      },
      config = function()
        require('fintory.packs.telescope')
      end
    },
    {
      'nvim-telescope/telescope-symbols.nvim',
      after = 'telescope.nvim',
      requires = { { 'kyazdani42/nvim-web-devicons' } }
    },
  })

  -- Displays a popup with possible key bindings of the command you started
  -- typing
  -- https://github.com/folke/which-key.nvim
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup { }
    end
  }

  -- Escape without getting delay when typing in insert mode
  -- https://github.com/max397574/better-escape.nvim
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  }

  use {
    "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
    end
  }

  -- Schema Store
  use {
    "b0o/SchemaStore.nvim",
    module = "schemastore"
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
