local group = vim.api.nvim_create_augroup("rbright_nvim", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 180 })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  pattern = "*",
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype

    if vim.bo[args.buf].modifiable and not vim.bo[args.buf].binary then
      local view = vim.fn.winsaveview()
      vim.cmd([[silent! keeppatterns %s/\s\+$//e]])
      vim.fn.winrestview(view)
    end

    if
      vim.tbl_contains({ "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" }, filetype)
    then
      for _, client in ipairs(vim.lsp.get_clients({ bufnr = args.buf, name = "oxlint" })) do
        client:request_sync("workspace/executeCommand", {
          command = "oxc.fixAll",
          arguments = { { uri = vim.uri_from_bufnr(args.buf) } },
        }, 1000, args.buf)
      end
    end

    local ok, conform = pcall(require, "conform")
    if ok then
      conform.format({ bufnr = args.buf, timeout_ms = 1000, lsp_format = "fallback", quiet = true })
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  group = group,
  callback = function(args)
    local ok, lint = pcall(require, "lint")
    if ok then
      lint.try_lint(nil, { ignore_errors = true })
    end
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  desc = "LSP defaults and keymaps",
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local buffer = event.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
    end

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
    end

    map("n", "K", vim.lsp.buf.hover, "Hover")
    map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
    map("n", "gd", function()
      Snacks.picker.lsp_definitions()
    end, "Goto definition")
    map("n", "gr", function()
      Snacks.picker.lsp_references()
    end, "Goto references")
    map("n", "gI", function()
      Snacks.picker.lsp_implementations()
    end, "Goto implementation")
    map("n", "gy", function()
      Snacks.picker.lsp_type_definitions()
    end, "Goto type definition")
    map("n", "<F2>", vim.lsp.buf.rename, "Rename symbol")
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code actions")
    map("n", "<leader>cr", vim.lsp.buf.rename, "Rename symbol")
    map("n", "<leader>cs", function()
      Snacks.picker.lsp_symbols({ layout = { preset = "right" } })
    end, "Document symbols")
    map("n", "<leader>cS", function()
      Snacks.picker.lsp_workspace_symbols({ layout = { preset = "ivy" } })
    end, "Workspace symbols")
    map("n", "<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
    map("n", "<leader>cf", function()
      require("conform").format({ bufnr = buffer, timeout_ms = 1000, lsp_format = "fallback" })
    end, "Format buffer")
    map("n", "[d", function()
      vim.diagnostic.goto_prev({ float = false })
    end, "Previous diagnostic")
    map("n", "]d", function()
      vim.diagnostic.goto_next({ float = false })
    end, "Next diagnostic")
    map("n", "[e", function()
      vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR, float = false })
    end, "Previous error")
    map("n", "]e", function()
      vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, float = false })
    end, "Next error")
    map("n", "<leader>uh", function()
      local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = buffer })
      vim.lsp.inlay_hint.enable(not enabled, { bufnr = buffer })
    end, "Toggle inlay hints")

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local highlight_group = vim.api.nvim_create_augroup("rbright_lsp_highlight_" .. buffer, { clear = true })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = highlight_group,
        buffer = buffer,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "LspDetach" }, {
        group = highlight_group,
        buffer = buffer,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  underline = true,
  virtual_text = {
    spacing = 2,
    source = "if_many",
    prefix = "●",
  },
  float = {
    source = "if_many",
    border = "rounded",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})
