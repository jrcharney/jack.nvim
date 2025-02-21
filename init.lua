-- init.lua
-- NeoVim config to mimic VS Code with Kickstart.nvim features

-- Plugin manager (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-tree/nvim-tree.lua", dependencies = "nvim-tree/nvim-web-devicons", config = true },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim", "nvim-telescope/telescope-ui-select.nvim" }, config = function()
      require("telescope").setup({
        extensions = {
          fzf = {},
          ["ui-select"] = {}
        }
      })
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
    end
  },
  { "williamboman/mason.nvim", config = function()
      require("mason").setup()
    end
  },
  { "williamboman/mason-lspconfig.nvim", dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" }, config = function()
      require("mason-lspconfig").setup({ ensure_installed = { "tsserver", "pyright", "clangd" } })
      local lspconfig = require("lspconfig")
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          lspconfig[server_name].setup {}
        end
      }
    end
  },
  { "williamboman/mason-tool-installer.nvim", dependencies = "williamboman/mason.nvim", config = function()
      require("mason-tool-installer").setup({ ensure_installed = { "prettier", "eslint", "black", "stylua" } })
    end
  },
  { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "hrsh7th/cmp-path", "saadparwaiz1/cmp_luasnip" }, config = true },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "python", "cpp", "javascript", "rust", "ruby", "css", "html", "java", "c_sharp", "bash" },
        highlight = { enable = true },
        indent = { enable = true }
      }
    end
  },
  { "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons", config = function()
      require("lualine").setup({ options = { theme = "auto", icons_enabled = true } })		-- TODO: Tell the synthweave guy to make a theme for lualine
    end
  },
  { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons", config = function()
      require("bufferline").setup({
        options = {
          show_buffer_close_icons = true,
          show_close_icon = true,
          separator_style = "slant"
        }
      })
    end
  },
  { "folke/tokyonight.nvim" -- , config = function()
    -- vim.cmd([[colorscheme tokyonight]])
    -- end

  },
  { "samharju/synthweave.nvim", config = function()
      require("synthweave").setup({ transparent = true })
      vim.cmd([[colorscheme synthweave]])
    end
  },
  { "kyazdani42/nvim-web-devicons", config = function()
      require("nvim-web-devicons").setup({ default = true })
    end
  },
  { "lewis6991/gitsigns.nvim", config = function()
      require("gitsigns").setup()
    end
  },
  { "folke/which-key.nvim", config = function()
      require("which-key").setup({
        icons = { separator = "→" }
      })
    end
  },
  { "echasnovski/mini.icons", config = function()
      require("mini.icons").setup()
    end
  },
  { "folke/lazydev.nvim", config = function()
      require("lazydev").setup()
    end
  },
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = function()
      require("todo-comments").setup()
    end
  },
  { "j-hui/fidget.nvim", config = function()
      require("fidget").setup()
    end
  },
  { "mfussenegger/nvim-lint", config = function()
      require("lint").linters_by_ft = {
        python = { "flake8" },
        javascript = { "eslint" },
        lua = { "luacheck" },
        cpp = { "clangtidy" },
        rust = { "clippy" },
        bash = { "shellcheck" },
      }
      -- Use symbols instead of letters for the signs
      vim.fn.sign_define("DiagnosticSignError", { text = "✘", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = "▲", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = "ℹ", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "➤", texthl = "DiagnosticSignHint" })
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  },
  { "mfussenegger/nvim-dap", dependencies = { "rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text", "nvim-neotest/nvim-nio" }, config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      require("nvim-dap-virtual-text").setup()
      
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
        }
      }
      
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  { "stevearc/conform.nvim", config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "black" },
          javascript = { "prettier" },
          bash = { "shfmt" },
        }
      })
    end
  },
  { "tpope/vim-sleuth" },
  { "Bilal2453/luvit-meta" },
  { "sindrets/winshift.nvim" },
  { "tpope/vim-repeat" },
  { "ggandor/leap.nvim" }
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {},
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en"
  end,
})

vim.opt.number = true             -- Enable line numbering
vim.opt.relativenumber = false    -- Disable relative line numbering

