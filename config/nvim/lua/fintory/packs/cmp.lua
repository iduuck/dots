return {
  'hrsh7th/nvim-cmp',
  dependencies = { 'saadparwaiz1/cmp_luasnip' },
  config = function()
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'

    cmp.setup({
      enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'

        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
          return true
        else
          return not context.in_treesitter_capture("comment")
              and not context.in_syntax_group("Comment")
        end
      end,
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 10 },
        { name = "path",     priority = 8 },
        { name = "luasnip" },
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 60,
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        })
      })
    })
  end
}
