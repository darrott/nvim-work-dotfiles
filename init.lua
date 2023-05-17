local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("darrott.settings")

require("lazy").setup({
  -- Which Key
  "folke/which-key.nvim",

  -- Neoconf
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
  },

  -- Neodev
  "folke/neodev.nvim",

  -- Mason
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("darrott.plugins.mason")
    end,
  },

  -- Neo Tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("darrott.plugins.neotree")
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    config = function()
      require("darrott.plugins.telescope")
    end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lua",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("darrott.plugins.cmp")
    end,
  },

  -- Lspkind
  {
    "onsails/lspkind-nvim",
    lazy = true,
    config = function()
      require("darrott.plugins.lspkind")
    end,
  },

  -- Trouble
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("darrott.plugins.trouble")
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("darrott.plugins.treesitter")
    end,
  },

  -- Status Line
  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("darrott.plugins.lualine")
    end,
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("darrott.plugins.bufferline")
    end,
  },

  -- Null-LS
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("darrott.plugins.null-ls")
    end,
  },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("darrott.plugins.autopairs")
    end,
  },

  -- Theme: OneDark
  {
    "navarasu/onedark.nvim",
    lazy = false,
    config = function()
      require("darrott.colorscheme.onedark")
    end,
  },
})

require("darrott.keybindings")
