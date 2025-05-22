return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
    },
    config = function()
      local cmp = require('cmp')
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
                              "force",
                              {},
                              vim.lsp.protocol.make_client_capabilities(),
                              cmp_lsp.default_capabilities())

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pylsp",
          "ansiblels",
          "bashls",
          "docker_compose_language_service",
          "yamlls"
        },
      })

      -- Funzione che viene chiamata quando un server LSP si collega al buffer
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
      
        -- Mappa i comandi LSP (questi saranno validi per tutti i server)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)      -- Vai alla definizione
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)           -- Mostra hover info
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)     -- Vai alla dichiarazione
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)  -- Vai all'implementazione
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)      -- Vai alle referenze
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)  -- Rinomina
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)  -- Azioni di codice (ad esempio, fix)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<Cmd>lua vim.lsp.buf.format()<CR>', opts)   -- Formatta
      end

      local lspconfig = require("lspconfig")

      lspconfig.pylsp.setup({
        on_attach = on_attach,
        settings = {
          pylsp = {
            configurationSources = {"pylint"},
            plugins = {
              -- Code format
              black = {
                enabled = false
              },
              isort = {
                enabled = false
              },
              autopep8 = {
                enabled = false
              },
              flake8 = {
                enabled = false,
                ignore = {'E501', 'E231'},
              },
              jedi = {
                enabled = false
              },
              mccabe = {
                enabled = false
              },
              preload = {
                enabled = false
              },
              pycodestyle = {
                enabled = false,
                ignore = {'E501'},
                maxLineLength = 120
              },
              pydocstyle = {
                enabled = false
              },
              pyflakes = {
                enabled = false
              },
              -- linter options
              pylint = {
                enabled = false,
                args = {"--disable=C0301"}
              },
              -- autoimport
              rope_autoimport = {
                enabled = false,
                code_actions = { enabled = true },
                completions = { enabled = true},
                memory = true
              },
              rope_completion = {
                enabled = false
              },
              yapf = {
                enabled = false
              },
              rope = {
                ropeFolder = "null"
              }
            },
          }
        }
      })

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }), 
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
        }, {
          { name = 'buffer' },
          { name = 'path'},
        }),
        formatting = {
          -- Personalizzazione dell'aspetto dei completamenti
          format = function(entry, vim_item)
            vim_item.kind = string.format("%s", vim_item.kind)
            return vim_item
          end,
        },
      })

      vim.diagnostic.config({
          update_in_insert = true,
          virtual_text = true,
          signs = true
      })
    end
}
