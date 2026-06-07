return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- Required for vim.lsp.enable
    vim.api.nvim_create_augroup("nvim.lsp.enable", { clear = true })

    -- LSP Keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "Code actions"
        vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, opts)

        opts.desc = "Rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Buffer diagnostics"
        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Line diagnostics"
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Hover docs"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      end,
    })

    -- Diagnostics UI
    local signs = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
      [vim.diagnostic.severity.INFO] = " ",
    }

    vim.diagnostic.config({
      signs = { text = signs },
      virtual_text = true,
      underline = true,
      update_in_insert = false,
    })

    -- Capabilities (cmp)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Import util (still valid from lspconfig)
    local util = require("lspconfig.util")

    -- =========================
    -- LSP SERVERS
    -- =========================

    -- Lua
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          completion = { callSnippet = "Replace" },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
    vim.lsp.enable("lua_ls")

    -- Emmet
    vim.lsp.config("emmet_ls", {
      capabilities = capabilities,
      filetypes = {
        "html", "typescriptreact", "javascriptreact",
        "css", "sass", "scss", "less", "svelte",
      },
    })
    vim.lsp.enable("emmet_ls")

    vim.lsp.config("emmet_language_server", {
      capabilities = capabilities,
      filetypes = {
        "css", "eruby", "html", "javascript",
        "javascriptreact", "less", "sass", "scss",
        "pug", "typescriptreact",
      },
      init_options = {
        showAbbreviationSuggestions = true,
        showExpandedAbbreviation = "always",
        showSuggestionsAsSnippets = false,
      },
    })
    vim.lsp.enable("emmet_language_server")

    -- Deno
    vim.lsp.config("denols", {
      capabilities = capabilities,
      root_dir = util.root_pattern("deno.json", "deno.jsonc"),
    })
    vim.lsp.enable("denols")

    -- TypeScript (ts_ls)
    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      root_dir = function(fname)
        return not util.root_pattern("deno.json", "deno.jsonc")(fname)
          and util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
      end,
      single_file_support = false,
      init_options = {
        preferences = {
          includeCompletionsWithSnippetText = true,
          includeCompletionsForImportStatements = true,
        },
      },
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
      end,
    })
    vim.lsp.enable("ts_ls")

    -- HTML
    vim.lsp.config("html", {
      capabilities = capabilities,
      filetypes = { "html", "templ" },
      cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-html-language-server", "--stdio" },
    })
    vim.lsp.enable("html")

    -- Bash
    vim.lsp.config("bashls", {
      capabilities = capabilities,
      filetypes = { "bash", "sh" },
      cmd = { vim.fn.stdpath("data") .. "/mason/bin/bash-language-server", "start" },
    })
    vim.lsp.enable("bashls")

    -- CSS
    vim.lsp.config("cssls", {
      capabilities = capabilities,
    })
    vim.lsp.enable("cssls")
  end,
}
