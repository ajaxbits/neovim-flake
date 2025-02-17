{
  description = "Alex's Neovim Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/23.11";
    flake-utils.url = "github:numtide/flake-utils";

    # LSP plugins
    nvim-lspconfig = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };
    nvim-treesitter = {
      url = "github:nvim-treesitter/nvim-treesitter?ref=v0.9.0";
      flake = false;
    };
    lspsaga = {
      url = "github:tami5/lspsaga.nvim";
      flake = false;
    };
    lspkind = {
      url = "github:onsails/lspkind-nvim";
      flake = false;
    };
    trouble = {
      url = "github:folke/trouble.nvim";
      flake = false;
    };
    nvim-treesitter-context = {
      url = "github:lewis6991/nvim-treesitter-context";
      flake = false;
    };
    nvim-lightbulb = {
      url = "github:kosayoda/nvim-lightbulb";
      flake = false;
    };

    # Debugging
    nvim-dap= {
      url = "github:mfussenegger/nvim-dap";
      flake = false;
    };
    nvim-dap-ui = {
      url = "github:rcarriga/nvim-dap-ui";
      flake = false;
    };
    nvim-dap-virtual-text = {
      url = "github:thehamsta/nvim-dap-virtual-text";
      flake = false;
    };
    telescope-dap-nvim = {
      url = "github:nvim-telescope/telescope-dap.nvim";
      flake = false;
    };
    # Debugging::Languages
    nvim-dap-python= {
      url = "github:mfussenegger/nvim-dap-python";
      flake = false;
    };

    nvim-code-action-menu = {
      url = "github:weilbith/nvim-code-action-menu";
      flake = false;
    };
    lsp-signature = {
      url = "github:ray-x/lsp_signature.nvim";
      flake = false;
    };
    null-ls = {
      url = "github:jose-elias-alvarez/null-ls.nvim";
      flake = false;
    };
    sqls-nvim = {
      url = "github:nanotee/sqls.nvim";
      flake = false;
    };
    rust-tools = {
      url = "github:simrat39/rust-tools.nvim";
      flake = false;
    };

    # Copying/Registers
    registers = {
      url = "github:tversteeg/registers.nvim";
      flake = false;
    };
    nvim-neoclip = {
      url = "github:AckslD/nvim-neoclip.lua";
      flake = false;
    };

    # Telescope
    telescope = {
      url = "github:nvim-telescope/telescope.nvim";
      flake = false;
    };

    # Langauge server (use master instead of nixpkgs)
    nil.url = "github:oxalica/nil";

    # Filetrees
    nvim-tree-lua = {
      url = "github:kyazdani42/nvim-tree.lua";
      flake = false;
    };

    # Tablines
    nvim-bufferline-lua = {
      url = "github:akinsho/nvim-bufferline.lua?ref=v3.0.1";
      flake = false;
    };

    # Statuslines
    lualine = {
      url = "github:hoob3rt/lualine.nvim";
      flake = false;
    };
    lualine-lsp-progress = {
      url = "github:arkav/lualine-lsp-progress";
      flake = false;
    };

    # Autocompletes
    nvim-compe = {
      url = "github:hrsh7th/nvim-compe";
      flake = false;
    };
    nvim-cmp = {
      url = "github:hrsh7th/nvim-cmp";
      flake = false;
    };
    cmp-buffer = {
      url = "github:hrsh7th/cmp-buffer";
      flake = false;
    };
    cmp-nvim-lsp = {
      url = "github:hrsh7th/cmp-nvim-lsp";
      flake = false;
    };
    cmp-vsnip = {
      url = "github:hrsh7th/cmp-vsnip";
      flake = false;
    };
    cmp-path = {
      url = "github:hrsh7th/cmp-path";
      flake = false;
    };
    cmp-treesitter = {
      url = "github:ray-x/cmp-treesitter";
      flake = false;
    };

    # ML
    copilot = {
      url = "github:zbirenbaum/copilot.lua";
      flake = false;
    };
    copilot-cmp = {
      url = "github:zbirenbaum/copilot-cmp";
      flake = false;
    };

    # snippets
    vim-vsnip = {
      url = "github:hrsh7th/vim-vsnip";
      flake = false;
    };

    # Autopairs
    nvim-autopairs = {
      url = "github:windwp/nvim-autopairs";
      flake = false;
    };
    nvim-ts-autotag = {
      url = "github:windwp/nvim-ts-autotag";
      flake = false;
    };
    nvim-surround = {
      url = "github:kylechui/nvim-surround";
      flake = false;
    };

    # Commenting
    kommentary = {
      url = "github:b3nj5m1n/kommentary";
      flake = false;
    };
    todo-comments = {
      url = "github:folke/todo-comments.nvim";
      flake = false;
    };

    # Buffer tools
    bufdelete-nvim = {
      url = "github:famiu/bufdelete.nvim";
      flake = false;
    };

    # Themes
    tokyonight = {
      url = "github:folke/tokyonight.nvim";
      flake = false;
    };
    onedark = {
      url = "github:navarasu/onedark.nvim";
      flake = false;
    };
    gruvbox = {
      url = "github:ellisonleao/gruvbox.nvim";
      flake = false;
    };

    # Rust crates
    crates-nvim = {
      url = "github:Saecki/crates.nvim";
      flake = false;
    };

    # Visuals
    nvim-cursorline = {
      url = "github:yamatsum/nvim-cursorline";
      flake = false;
    };
    indent-blankline = {
      url = "github:lukas-reineke/indent-blankline.nvim";
      flake = false;
    };
    nvim-web-devicons = {
      url = "github:kyazdani42/nvim-web-devicons";
      flake = false;
    };
    gitsigns-nvim = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };

    # Key binding help
    leap = {
      url = "github:ggandor/leap.nvim";
      flake = false;
    };
    leap-ast = {
      url = "github:ggandor/leap-ast.nvim";
      flake = false;
    };
    leap-spooky = {
      url = "github:ggandor/leap-spooky.nvim";
      flake = false;
    };
    which-key = {
      url = "github:folke/which-key.nvim";
      flake = false;
    };

    # IDE management
    neovim-project = {
      url = "github:coffebar/neovim-project";
      flake = false;
    };
    neovim-session-manager = {
      url = "github:shatur/neovim-session-manager";
      flake = false;
    };
    auto-save-nvim = {
      url = "github:pocco81/auto-save.nvim";
      flake = false;
    };

    # Markdown
    glow-nvim = {
      url = "github:ellisonleao/glow.nvim";
      flake = false;
    };

    # Plenary (required by crates-nvim)
    plenary-nvim = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };

    # Git
    lazygit = {
      url = "github:kdheepak/lazygit.nvim";
      flake = false;
    };
    gitlinker-nvim = {
      url = "github:ruifm/gitlinker.nvim";
      flake = false;
    };
    diffview-nvim = {
      url = "github:sindrets/diffview.nvim";
      flake = false;
    };

    # other
    leetcode = {
      url = "github:kawre/leetcode.nvim";
      flake = false;
    };
    nvim-notify = {
      url = "github:rcarriga/nvim-notify";
      flake = false;
    };
    nui = {
      url = "github:MunifTanjim/nui.nvim";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  } @ inputs: let
    configuredSystems = [
      "x86_64-linux"
      "aarch64-darwin"
    ];
  in
    flake-utils.lib.eachSystem configuredSystems (system: let
      # Plugin must be same as input name
      plugins = [
        "auto-save-nvim"
        "bufdelete-nvim"
        "chatgpt"
        "cmp-buffer"
        "cmp-nvim-lsp"
        "cmp-path"
        "cmp-treesitter"
        "cmp-vsnip"
        "copilot"
        "copilot-cmp"
        "crates-nvim"
        "diffview-nvim"
        "gitlinker-nvim"
        "gitsigns-nvim"
        "glow-nvim"
        "gruvbox"
        "indent-blankline"
        "kommentary"
        "lazygit"
        "leap"
        "leap-ast"
        "leap-spooky"
        "leetcode"
        "lspkind"
        "lspsaga"
        "lsp-signature"
        "lualine"
        "lualine-lsp-progress"
        "neovim-project"
        "neovim-session-manager"
        "nui"
        "null-ls"
        "nvim-autopairs"
        "nvim-bufferline-lua"
        "nvim-cmp"
        "nvim-code-action-menu"
        "nvim-compe"
        "nvim-cursorline"
        "nvim-dap"
        "nvim-dap-python"
        "nvim-dap-ui"
        "nvim-dap-virtual-text"
        "nvim-lightbulb"
        "nvim-lspconfig"
        "nvim-notify"
        "nvim-surround"
        "nvim-tree-lua"
        "nvim-treesitter"
        "nvim-treesitter-context"
        "nvim-ts-autotag"
        "nvim-web-devicons"
        "onedark"
        "plenary-nvim"
        "rust-tools"
        "sqls-nvim"
        "telescope"
        "telescope-dap-nvim"
        "todo-comments"
        "tokyonight"
        "trouble"
        "vim-vsnip"
        "which-key"
      ];

      pluginOverlay = lib.buildPluginOverlay;

      pkgs = import nixpkgs {
        inherit system;
        config = {allowUnfree = true;};
        overlays = [
          pluginOverlay
          (final: prev: {
            nil = inputs.nil.packages.${system}.default;
          })
        ];
      };

      lib = import ./lib {inherit pkgs inputs plugins;};

      inherit (lib) neovimBuilder;

      configBuilder = isMaximal: {
        config = {
          vim.viAlias = true;
          vim.vimAlias = true;
          vim.lineNumberMode = "number";
          vim.telescope.enable = true;
          vim.project-management = {
            enable = true;
            autosave.enable = true;
          };
          vim.lsp = {
            enable = true;
            formatOnSave = false;
            lightbulb.enable = true;
            lspsaga.enable = false;
            nvimCodeActionMenu.enable = true;
            trouble.enable = true;
            todo-comments.enable = true;
            lspSignature.enable = true;
            nix = true;
            rust.enable = isMaximal;
            python.enable = isMaximal;
            python.format = pkgs.system != "aarch64-darwin";
            bash.enable = isMaximal;
            terraform.enable = isMaximal;
            terraform.lint = isMaximal;
            clang.enable = isMaximal;
            sql = false;
            yaml = true;
            ts = isMaximal;
            go = isMaximal;
            hare = isMaximal;
          };
          vim.visuals = {
            enable = true;
            nvimWebDevicons.enable = true;
            lspkind.enable = true;
            indentBlankline = {
              enable = true;
              fillChar = "";
              eolChar = "";
              showCurrContext = true;
            };
            cursorWordline = {
              enable = true;
              lineTimeout = 0;
            };
          };
          vim.statusline.lualine = {
            enable = true;
            theme = "gruvbox";
            icons = true;
            lsp-progress = true;
          };
          vim.theme = {
            enable = true;
            name = "gruvbox";
          };
          vim.autopairs.enable = true;
          vim.surround.enable = true;
          vim.autocomplete = {
            enable = true;
            type = "nvim-cmp";
            copilot.enable = false;
          };
          vim.filetree.nvimTreeLua = {
            enable = true;
            resizeOnFileOpen = true;
            hideFiles = [
              "node_modules"
              ".cache"
              ".DS_Store"
            ];
          };
          vim.tabline.nvimBufferline.enable = true;
          vim.treesitter = {
            enable = true;
            context.enable = false;
          };
          vim.keys = {
            enable = true;
            whichKey.enable = true;
            leap = {
              enable = true;
              ast = true;
              spooky = true;
            };
            kommentary.enable = true;
          };
          vim.snippets = {
            vsnip.enable = true;
            chatgpt.enable = false;
          };
          vim.markdown = {
            enable = true;
            glow.enable = false;
            markdown-preview.enable = true;
          };
          vim.git = {
            enable = true;
            gitsigns.enable = true;
            lazygit.enable = true;
            gitlinker.enable = true;
            diffview.enable = true;
          };
        };
      };
      vsCodeConfig = {
        config = {
          vim.viAlias = false;
          vim.vimAlias = false;
          vim.lineNumberMode = "number";
          vim.lsp.enable = false;
          vim.visuals.enable = false;
          vim.statusline.lualine.enable = false;
          vim.theme.enable = false;
          vim.autopairs.enable = false;
          vim.autocomplete.enable = false;
          vim.filetree.nvimTreeLua.enable = false;
          vim.tabline.nvimBufferline.enable = false;
          vim.treesitter.enable = false;
          vim.surround.enable = true;
          vim.syntaxHighlighting = false;
          vim.keys = {
            enable = true;
            leap = {
              enable = true;
              ast = true;
              spooky = true;
            };
            kommentary.enable = true;
          };
          vim.markdown.enable = false;
          vim.git.enable = false;
        };
      };

      leetcodeConfig = {
        config = {
          vim.leetcode = {
            enable = true;
            language = "rust";
          };
          vim.viAlias = false;
          vim.vimAlias = false;
          vim.lineNumberMode = "number";
          vim.lsp = {
            enable = true;
            formatOnSave = false;
            lightbulb.enable = true;
            lspsaga.enable = false;
            nvimCodeActionMenu.enable = true;
            trouble.enable = true;
            todo-comments.enable = true;
            lspSignature.enable = true;
            nix = true;
            rust.enable = true;
            python.enable = true;
            python.format = false;
            go = true;
          };
          vim.visuals = {
            enable = true;
            nvimWebDevicons.enable = true;
            lspkind.enable = true;
            indentBlankline = {
              enable = true;
              fillChar = "";
              eolChar = "";
              showCurrContext = true;
            };
            cursorWordline = {
              enable = true;
              lineTimeout = 0;
            };
          };
          vim.statusline.lualine = {
            enable = true;
            theme = "gruvbox";
            icons = true;
            lsp-progress = true;
          };
          vim.theme = {
            enable = true;
            name = "gruvbox";
          };
          vim.autopairs.enable = true;
          vim.surround.enable = true;
          vim.autocomplete = {
            enable = true;
            type = "nvim-cmp";
            copilot.enable = false;
          };
          vim.filetree.nvimTreeLua.enable = false;
          vim.tabline.nvimBufferline.enable = false;
          vim.syntaxHighlighting = true;
          vim.keys = {
            enable = true;
            leap = {
              enable = true;
              ast = true;
              spooky = true;
            };
            kommentary.enable = true;
          };
          vim.snippets = {
            vsnip.enable = true;
            chatgpt.enable = false;
          };
        };
      };
    in rec {
      apps = rec {
        nvim = flake-utils.lib.mkApp {
          drv = packages.default;
        };
        default = nvim;
      };

      devShells = {
        default = pkgs.mkShell {
          buildInputs = [(neovimBuilder (configBuilder false))];
        };
      };

      overlays.default = final: prev: {
        inherit neovimBuilder;
        inherit (packages.${system}) neovimAJ;
        inherit (pkgs) neovimPlugins;
      };

      packages = flake-utils.lib.flattenTree rec {
        default = neovimAJ;
        neovimAJ = neovimBuilder (configBuilder true);
        neovimVSCode = let
          origPackage = neovimBuilder vsCodeConfig;
          newBinName = "nvim-vscode";
        in
          pkgs.stdenv.mkDerivation {
            name = newBinName;
            buildInputs = [origPackage];
            buildCommand = ''
              mkdir -p $out/bin
              ln -s ${origPackage}/bin/nvim $out/bin/${newBinName}
            '';
          };
        leetcode = let
          origPackage = neovimBuilder leetcodeConfig;
          newBinName = "leetcode";
        in
          pkgs.stdenv.mkDerivation {
            name = newBinName;
            nativeBuildInputs = with pkgs; [makeWrapper pkg-config];
            buildInputs = [origPackage];
            buildCommand = ''
              mkdir -p $out/bin
              cat > $out/bin/${newBinName} <<EOF
              #!/usr/bin/env sh
              RUST_SRC_PATH=${pkgs.rust.packages.stable.rustPlatform.rustLibSrc} \
                ${origPackage}/bin/nvim leetcode.nvim
              EOF

              chmod +x $out/bin/${newBinName}

              wrapProgram $out/bin/${newBinName} \
                --prefix PATH : ${pkgs.lib.makeBinPath [
                pkgs.cargo
                pkgs.rustc
                pkgs.gcc
                pkgs.clippy
                pkgs.rustfmt
                pkgs.rust-analyzer
              ]} \
                --prefix RUST_SRC_PATH : ${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}
            '';
          };
      };
    });

  nixConfig = {
    extra-substituters = ["https://cache.garnix.io"];

    extra-trusted-public-keys = [
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };
}
