{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.autocomplete;
in {
  options.vim = {
    autocomplete = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "enable autocomplete";
      };

      type = mkOption {
        default = "nvim-cmp";
        description = "Set the autocomplete plugin. Options: [nvim-cmp]";
        type = types.enum ["nvim-cmp"];
      };

      copilot = {
        enable = mkOption {
          type = types.bool;
          default = false;
          description = "enable copilot";
        };
      };
    };
  };

  imports = [./copilot.nix];

  config = mkIf cfg.enable (
    let
      writeIf = cond: msg:
        if cond
        then msg
        else "";
    in {
      vim.startPlugins = with pkgs.neovimPlugins; (
        if cfg.type == "nvim-cmp"
        then [
          nvim-cmp
          cmp-buffer
          cmp-vsnip
          cmp-path
          cmp-treesitter
        ]
        else []
      );

      vim.luaConfigRC = writeIf (cfg.type == "nvim-cmp") ''
        local has_words_before = function()
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local feedkey = function(key, mode)
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
        end

        local cmp = require'cmp'
        cmp.setup({
          snippet = {
            expand = function(args)
              vim.fn["vsnip#anonymous"](args.body)
            end,
          },
          sources = {
            ${writeIf config.vim.lsp.enable "{ name = 'nvim_lsp' },"}
            ${writeIf config.vim.lsp.rust.enable "{ name = 'crates' },"}
            { name = 'vsnip' },
            ${writeIf config.vim.autocomplete.copilot.enable "{ name = 'copilot'},"}
            { name = 'treesitter' },
            { name = 'path' },
            { name = 'buffer' },
          },
          mapping = {
            ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c'}),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c'}),
            ['<C-y>'] = cmp.config.disable,
            ['<C-e>'] = cmp.mapping({
              i = cmp.mapping.abort(),
              c = cmp.mapping.close(),
            }),
            ['<CR>'] = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
            }),
            ['<Tab>'] = cmp.mapping(function (fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif vim.fn['vsnip#available'](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function (fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif vim.fn['vsnip#available'](-1) == 1 then
                feedkeys("<Plug>(vsnip-jump-prev)", "")
              end
            end, { 'i', 's' })
          },
          completion = {
            completeopt = 'menu,menuone,noinsert',
          },
        })
        ${writeIf (config.vim.autopairs.enable && config.vim.autopairs.type == "nvim-autopairs") ''
          local cmp_autopairs = require('nvim-autopairs.completion.cmp')
          cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { text = ""} }))
        ''}
      '';

      vim.snippets.vsnip.enable =
        if (cfg.type == "nvim-cmp")
        then true
        else config.vim.snippets.vsnip.enable;
    }
  );
}
