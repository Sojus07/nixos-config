local cmp = require("cmp")
local lspkind = require("lspkind")

vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }

cmp.setup({
formatting = {
  format = function(entry, vim_item)
    vim_item.menu = ({
      nvim_lsp = "[LSP]",
      buffer = "[BUF]",
      path = "[PATH]",
      luasnip = "[SNIP]",
      nvim_lua = "[LUA]",
    })[entry.source.name]

    vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
    return vim_item
  end,
},
sorting = {
  comparators = {
    cmp.config.compare.offset,
    cmp.config.compare.exact,
    cmp.config.compare.recently_used,
    cmp.config.compare.kind,
    cmp.config.compare.sort_text,
    cmp.config.compare.length,
    cmp.config.compare.order,
  },
},
window = {
  completion = {
    autocomplete = true,
    col_offset = -3,
    side_padding = 0,
  },
  completion = cmp.config.window.bordered({
    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
  }),
  documentation = cmp.config.window.bordered({
    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
  }),
},
mapping = cmp.mapping.preset.insert({
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
    end
  end, { "i", "s" }),

  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end, { "i", "s" }),

  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.abort(),
  ["<C-Left>"] = cmp.mapping.abort(),
  ["<CR>"] = cmp.mapping.confirm({ select = false }),
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'luasnip' },
  { name = 'buffer' },
  { name = 'path' },
  { name = 'nvim_lua' },
}),
})

