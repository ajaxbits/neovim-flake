{
  description = "Alex's Neovim Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # LSP plugins
    nvim-lspconfig = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };
    nvim-treesitter = {
      url = "github:nvim-treesitter/nvim-treesitter";
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

    lazygit = {
      url = "github:kdheepak/lazygit.nvim";
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
        "nvim-treesitter-context"
        "gitsigns-nvim"
        "plenary-nvim"
        "nvim-lspconfig"
        "nvim-treesitter"
        "lspsaga"
        "lspkind"
        "nvim-lightbulb"
        "lsp-signature"
        "nvim-tree-lua"
        "nvim-bufferline-lua"
        "lualine"
        "lualine-lsp-progress"
        "nvim-compe"
        "nvim-autopairs"
        "nvim-ts-autotag"
        "nvim-web-devicons"
        "tokyonight"
        "bufdelete-nvim"
        "nvim-cmp"
        "cmp-nvim-lsp"
        "cmp-buffer"
        "cmp-vsnip"
        "cmp-path"
        "cmp-treesitter"
        "copilot"
        "copilot-cmp"
        "crates-nvim"
        "vim-vsnip"
        "nvim-code-action-menu"
        "trouble"
        "null-ls"
        "which-key"
        "leap"
        "leap-ast"
        "leap-spooky"
        "indent-blankline"
        "nvim-cursorline"
        "sqls-nvim"
        "glow-nvim"
        "telescope"
        "rust-tools"
        "onedark"
        "gruvbox"
        "kommentary"
        "todo-comments"
        "lazygit"
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

      neovimBuilder = lib.neovimBuilder;

      configBuilder = isMaximal: {
        config = {
          vim.viAlias = true;
          vim.vimAlias = true;
          vim.lineNumberMode = "number";
          vim.lsp = {
            enable = true;
            formatOnSave = true;
            lightbulb.enable = true;
            lspsaga.enable = false;
            nvimCodeActionMenu.enable = true;
            trouble.enable = true;
            todo-comments.enable = true;
            lspSignature.enable = true;
            nix = true;
            rust.enable = isMaximal;
            python.enable = isMaximal;
            python.format = false;
            terraform.enable = isMaximal;
            terraform.lint = isMaximal;
            clang.enable = isMaximal;
            sql = isMaximal;
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
          vim.autocomplete = {
            enable = true;
            type = "nvim-cmp";
            copilot.enable = true;
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
            context.enable = true;
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
          vim.telescope = {enable = true;};
          vim.markdown = {
            enable = true;
            glow.enable = true;
          };
          vim.git = {
            enable = true;
            gitsigns.enable = true;
            lazygit.enable = true;
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
        neovimAJ = packages.${system}.neovimAJ;
        neovimPlugins = pkgs.neovimPlugins;
      };

      packages = flake-utils.lib.flattenTree rec {
        default = neovimAJ;
        neovimAJ = neovimBuilder (configBuilder true);
      };
    });
}
