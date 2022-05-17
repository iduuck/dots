local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function ()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Basic plugins without need of 
  use 'tpope/vim-bundler'
  use 'tpope/vim-eunuch'
  use {
    'tpope/vim-fugitive',
    config = function()
      require('fintory.packs.fugitive')
    end
  }
  use 'tpope/vim-rails'
  use 'tpope/vim-rake'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-dispatch'
  use 'vim-scripts/tComment'

  -- Multiple packs for better syntax support.
  use 'tomlion/vim-solidity'
  use 'pangloss/vim-javascript'

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

  -- Inject LSP diagnostics, code actions, etc. into LUA
  -- https://github.com/jose-elias-alvarez/null-ls.nvim
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('fintory.packs.null-ls')
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

  -- LUA alternative to lightline.vim
  -- https://github.com/nvim-lualine/lualine.nvim
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('fintory.packs.lualine')
    end
  }

  -- Source for nvim-cmp for supporting LuaSnip
  -- https://github.com/saadparwaiz1/cmp_luasnip
  use {
    'saadparwaiz1/cmp_luasnip',
    after = 'nvim-cmp'
  }

  -- Actual cmp implementation
  -- https://github.com/hrsh7th/nvim-cmp
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {
        -- Important lua snippets for nvim-cmp
        -- https://github.com/L3MON4D3/LuaSnip
        'L3MON4D3/LuaSnip',
        event = 'CursorHold',
        config = function()
          require('fintory.packs.luasnip')
        end,
        -- requires = { 'rafamadriz/friendly-snippets' },
      },
    },
  }

  -- Lightweight LSP plugin with highly performant UI.
  -- https://github.com/tami5/lspsaga.nvim
  use 'tami5/lspsaga.nvim'

  -- Tree-shitter for parsing and syntax features.
  -- https://github.com/nvim-treesitter/nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('fintory.packs.treesitter')
    end
  }

  -- Tree-shitter playground
  -- https://github.com/nvim-treesitter/playground
  use {
    'nvim-treesitter/playground',
    after = 'nvim-treesitter'
  }

  -- UI stuff for usage of other packs
  -- https://github.com/nvim-lua/plenary.nvim
  use 'nvim-lua/plenary.nvim'

  -- Telescope implementation
  -- https://github.com/nvim-telescope/telescope.nvim
  use({ 
    {
      'nvim-telescope/telescope.nvim',
      event = 'CursorHold',
      requires = { { 'nvim-lua/plenary.nvim' } },
      config = function()
        require('fintory.packs.telescope')
      end
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      after = 'telescope.nvim',
      run = 'make',
      config = function()
        -- Do the plain setup for Telescope
        require('telescope').setup({
          defaults = {
            prompt_prefix = ' ❯ ',
          },
          extensions = {
            fzy = {
              fuzzy = true,
              override_generic_sorter = false,
              override_file_sorter = true,
            },
          },
        })

        require('telescope').load_extension('fzf')
      end,
    },
    {
      'nvim-telescope/telescope-symbols.nvim',
      after = 'telescope.nvim',
      requires = { { 'kyazdani42/nvim-web-devicons' } }
    }
  })

  use {
    'projekt0n/github-nvim-theme',
    after = "lualine.nvim",
    config = function()
      require('github-theme').setup({
        theme_style = 'dimmed'
      })
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
