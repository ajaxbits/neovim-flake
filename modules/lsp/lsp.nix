{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.lsp;
in {
  options.vim.lsp = {
    enable = mkEnableOption "neovim lsp support";
    formatOnSave = mkEnableOption "Format on save";
    nix = mkEnableOption "Nix LSP";
    rust = {
      enable = mkEnableOption "Rust LSP";
      rustAnalyzerOpts = mkOption {
        type = types.str;
        default = ''
          ["rust-analyzer"] = {
            experimental = {
              procAttrMacros = true,
            },
          },
        '';
        description = "options to pass to rust analyzer";
      };
    };
    python = {
      enable = mkEnableOption "Python LSP";
      format = mkEnableOption "Enable Black code formatting.";
    };
    bash = {
      enable = mkEnableOption "Bash LSP";
    };
    clang = {
      enable = mkEnableOption "C language LSP";
      c_header = mkEnableOption "C syntax header files";
      cclsOpts = mkOption {
        type = types.str;
        default = "";
      };
    };
    sql = mkEnableOption "SQL Language LSP";
    yaml = mkEnableOption "Yaml Language LSP (with github actions support)";
    go = mkEnableOption "Go language LSP";
    ts = mkEnableOption "TS language LSP";
    hare = mkEnableOption "Hare plugin (not LSP)";
    terraform = {
      enable = mkEnableOption "Terraform Lanuage LSP";
      lint = mkEnableOption "add linting for Terraform";
    };
  };

  config = mkIf cfg.enable (
    let
      writeIf = cond: msg:
        if cond
        then msg
        else "";
    in {
      vim.startPlugins = with pkgs.neovimPlugins;
        [
          nvim-lspconfig
          null-ls
          (
            if (config.vim.autocomplete.enable && (config.vim.autocomplete.type == "nvim-cmp"))
            then cmp-nvim-lsp
            else null
          )
          (
            if cfg.sql
            then sqls-nvim
            else null
          )
        ]
        ++ (
          if cfg.rust.enable
          then [
            crates-nvim
            rust-tools
          ]
          else []
        );

      vim.configRC = ''
        ${
          if cfg.rust.enable
          then ''
            function! MapRustTools()
              nnoremap <silent><leader>ri <cmd>lua require('rust-tools.inlay_hints').toggle_inlay_hints()<CR>
              nnoremap <silent><leader>rr <cmd>lua require('rust-tools.runnables').runnables()<CR>
              nnoremap <silent><leader>re <cmd>lua require('rust-tools.expand_macro').expand_macro()<CR>
              nnoremap <silent><leader>rc <cmd>lua require('rust-tools.open_cargo_toml').open_cargo_toml()<CR>
              nnoremap <silent><leader>rg <cmd>lua require('rust-tools.crate_graph').view_crate_graph('x11', nil)<CR>
            endfunction

            autocmd filetype rust nnoremap <silent><leader>ri <cmd>lua require('rust-tools.inlay_hints').toggle_inlay_hints()<CR>
            autocmd filetype rust nnoremap <silent><leader>rr <cmd>lua require('rust-tools.runnables').runnables()<CR>
            autocmd filetype rust nnoremap <silent><leader>re <cmd>lua require('rust-tools.expand_macro').expand_macro()<CR>
            autocmd filetype rust nnoremap <silent><leader>rc <cmd>lua require('rust-tools.open_cargo_toml').open_cargo_toml()<CR>
            autocmd filetype rust nnoremap <silent><leader>rg <cmd>lua require('rust-tools.crate_graph').view_crate_graph('x11', nil)<CR>
          ''
          else ""
        }

        ${
          if cfg.nix
          then ''
            autocmd filetype nix setlocal tabstop=2 shiftwidth=2 softtabstop=2
          ''
          else ""
        }

        ${
          if cfg.clang.c_header
          then ''
            " c syntax for header (otherwise breaks treesitter highlighting)
            " https://www.reddit.com/r/neovim/comments/orfpcd/question_does_the_c_parser_from_nvimtreesitter/
            let g:c_syntax_for_h = 1
          ''
          else ""
        }
      '';
      vim.luaConfigRC = ''
        local attach_keymaps = function(client, bufnr)
          local opts = { noremap=true, silent=true }

          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

          -- taken from https://github.com/astral-sh/ruff-lsp
          local bufopts = { noremap=true, silent=true, buffer=bufnr }

          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
          vim.keymap.set('n', '<space>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
        end

        local null_ls = require("null-ls")
        local null_helpers = require("null-ls.helpers")
        local null_methods = require("null-ls.methods")

        local ls_sources = {
          ${writeIf cfg.python.format
          ''
            null_ls.builtins.formatting.black.with({
              command = "${pkgs.black}/bin/black",
            }),
          ''}
          ${writeIf (config.vim.git.enable && config.vim.git.gitsigns.enable) ''
          null_ls.builtins.code_actions.gitsigns,
        ''}
          ${writeIf cfg.sql
          ''
            null_helpers.make_builtin({
              method = null_methods.internal.FORMATTING,
              filetypes = { "sql" },
              generator_opts = {
                to_stdin = true,
                ignore_stderr = true,
                suppress_errors = true,
                command = "${pkgs.sqlfluff}/bin/sqlfluff",
                args = {
                  "fix",
                  "-",
                },
              },
              factory = null_helpers.formatter_factory,
            }),

            null_ls.builtins.diagnostics.sqlfluff.with({
              command = "${pkgs.sqlfluff}/bin/sqlfluff",
              extra_args = {"--dialect", "snowflake"}
            }),
          ''}
          ${writeIf cfg.nix
          ''
            null_ls.builtins.formatting.alejandra.with({
              command = "${pkgs.alejandra}/bin/alejandra"
            }),
          ''}

          ${writeIf cfg.ts
          ''
            null_ls.builtins.diagnostics.eslint,
            null_ls.builtins.formatting.prettier,
          ''}
        }

        vim.g.formatsave = ${
          if cfg.formatOnSave
          then "true"
          else "false"
        };

        -- Enable formatting
        format_callback = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              if vim.g.formatsave then
                  vim.lsp.buf.format()
                  -- local params = require'vim.lsp.util'.make_formatting_params({})
                  -- client.request('textDocument/formatting', params, nil, bufnr)
              end
            end
          })
        end

        default_on_attach = function(client, bufnr)
          attach_keymaps(client, bufnr)
          format_callback(client, bufnr)
        end

        no_format_on_attach = function(client, bufnr)
          attach_keymaps(client, bufnr)
        end

        -- Enable null-ls
        require('null-ls').setup({
          diagnostics_format = "[#{m}] #{s} (#{c})",
          debounce = 250,
          default_timeout = 5000,
          sources = ls_sources,
          on_attach=default_on_attach
        })

        -- Enable lspconfig
        local lspconfig = require('lspconfig')

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        ${
          let
            cfg = config.vim.autocomplete;
          in
            writeIf cfg.enable (
              if cfg.type == "nvim-cmp"
              then ''
                capabilities = require('cmp_nvim_lsp').default_capabilities()
              ''
              else ""
            )
        }

        ${writeIf cfg.rust.enable ''
          -- Rust config

          local rustopts = {
            tools = {
              autoSetHints = true,
              hover_with_actions = false,
              inlay_hints = {
                only_current_line = false,
              }
            },
            server = {
              capabilities = capabilities,
              on_attach = default_on_attach,
              cmd = {"${pkgs.rust-analyzer}/bin/rust-analyzer"},
              settings = {
                ${cfg.rust.rustAnalyzerOpts}
              }
            }
          }

          require('crates').setup {
            null_ls = {
              enabled = true,
              name = "crates.nvim",
            }
          }
          require('rust-tools').setup(rustopts)
        ''}

        ${writeIf cfg.python.enable ''
          -- Python config
          lspconfig.ruff_lsp.setup{
            on_attach=function(client, bufnr)
              client.server_capabilities.hoverProvider = false
              attach_keymaps(client, bufnr)
             ${
            if cfg.python.format
            then "format_callback(client, bufnr)"
            else ""
          }
            end,
            cmd = {"${pkgs.python311Packages.ruff-lsp}/bin/ruff-lsp"}
          }
          lspconfig.pyright.setup{
            capabilities = capabilities;
            on_attach=${
            if cfg.python.format
            then "default_on_attach"
            else "no_format_on_attach"
          },
            settings = {
              pyright = {
                autoImportCompletion = true,
                disableOrganizeImports = true,
              },
              python = {
                analysis = {
                  autoSearchPaths = true,
                  diagnosticMode = "openFilesOnly",
                  useLibraryCodeForTypes = true
                }
              }
            },
            cmd = {"${pkgs.nodePackages.pyright}/bin/pyright-langserver", "--stdio"}
          }
        ''}

        ${writeIf cfg.terraform.enable ''
          -- Terraform config
          vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
          vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
          vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
          vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=hcl]])
          vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

          lspconfig.terraformls.setup{
            capabilities = capabilities,
            on_attach=default_on_attach,
            cmd = {"${pkgs.terraform-ls}/bin/terraform-ls", "serve"},
            filetypes = { "terraform", "hcl", "terraform-vars" },
          }
        ''}

        ${writeIf cfg.terraform.lint ''
          lspconfig.tflint.setup{
            capabilities = capabilities;
            on_attach=default_on_attach,
            cmd = {"${pkgs.tflint}/bin/tflint", "--langserver"},
          }
        ''}

        ${writeIf cfg.bash.enable ''
          -- Bash config
          lspconfig.bashls.setup{
            capabilities = capabilities;
            on_attach=no_format_on_attach,
            cmd = {"${pkgs.nodePackages.bash-language-server}/bin/bash-language-server", "start"},
          }
        ''}

        ${writeIf cfg.nix ''
          -- Nix config
          -- TODO: change to nixd
          lspconfig.nil_ls.setup{
            capabilities = capabilities;
            on_attach = function(client, bufnr)
              attach_keymaps(client, bufnr)
            end,
            cmd = {"${pkgs.nil}/bin/nil"},
          }
        ''}

        ${writeIf cfg.clang.enable ''
          -- CCLS (clang) config
          lspconfig.ccls.setup{
            capabilities = capabilities;
            on_attach=default_on_attach;
            cmd = {"${pkgs.ccls}/bin/ccls"};
            ${
            if cfg.clang.cclsOpts == ""
            then ""
            else "init_options = ${cfg.clang.cclsOpts}"
          }
          }
        ''}

        ${writeIf cfg.yaml ''
          -- YAMLLS config
          lspconfig.yamlls.setup {
            capabilities = capabilities;
            on_attach = default_on_attach;
            cmd = {"${pkgs.nodePackages.yaml-language-server}/bin/yaml-language-server", "--stdio"},
            settings = {
              yaml = {
                schemas = {
                  ["https://json.schemastore.org/github-workflow.json"] = "/.github/**/*",
                },
              },
            },
          }
        ''}

        ${writeIf cfg.sql ''
          -- SQLS config
          lspconfig.sqls.setup {
            on_attach = function(client)
              client.server_capabilities.execute_command = true
              on_attach_keymaps(client, bufnr)
              require'sqls'.setup{}
            end,
            cmd = {"${pkgs.sqls}/bin/sqls", "-config", string.format("%s/config.yml", vim.fn.getcwd()) }
          }
        ''}

        ${writeIf cfg.go ''
          -- Go config
          lspconfig.gopls.setup {
            capabilities = capabilities;
            on_attach = default_on_attach;
            cmd = {"${pkgs.gopls}/bin/gopls", "serve"},
          }
        ''}

        ${writeIf cfg.ts ''
          -- TS config
          lspconfig.tsserver.setup {
            capabilities = capabilities;
            on_attach = function(client, bufnr)
              attach_keymaps(client, bufnr)
            end,
            cmd = { "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server", "--stdio" }
          }
        ''}
      '';
    }
  );
}
