local map = vim.keymap.set

local function zed_picker(picker, opts)
  return function()
    opts = opts or {}
    if type(picker) == "function" then
      picker(opts)
      return
    end
    Snacks.picker[picker](opts)
  end
end

local function split(direction)
  return function()
    if direction == "left" then
      vim.cmd.vsplit()
      vim.cmd.wincmd("h")
    elseif direction == "right" then
      vim.cmd.vsplit()
      vim.cmd.wincmd("l")
    elseif direction == "up" then
      vim.cmd.split()
      vim.cmd.wincmd("k")
    else
      vim.cmd.split()
      vim.cmd.wincmd("j")
    end
  end
end

local function goto_line()
  vim.ui.input({ prompt = "Go to line: " }, function(input)
    if not input or input == "" then
      return
    end

    local line = tonumber(input)
    if line then
      vim.api.nvim_win_set_cursor(0, { line, 0 })
    end
  end)
end

map({ "n", "i", "v" }, "<F1>", "<Nop>", { silent = true })
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })
map("n", ";", ":")

map({ "n", "i", "v" }, "<C-s>", function()
  vim.cmd.write()
end, { desc = "Save file" })
map("n", "<leader>w", function()
  vim.cmd.write()
end, { desc = "Save file" })
map("n", "<leader>q", function()
  vim.cmd.quit()
end, { desc = "Quit window" })
map("n", "<C-q>", function()
  Snacks.bufdelete()
end, { desc = "Close buffer" })

map("n", "<C-p>", zed_picker("smart"), { desc = "Find files" })
map("n", "<D-p>", zed_picker("smart"), { desc = "Find files" })
map("n", "<leader>p", zed_picker("commands", { layout = { preset = "vscode" } }), { desc = "Command palette" })
map("n", "<D-S-p>", zed_picker("commands", { layout = { preset = "vscode" } }), { desc = "Command palette" })
map("n", "<M-p>", zed_picker("commands", { layout = { preset = "vscode" } }), { desc = "Command palette" })
map("n", "<M-e>", function()
  Snacks.explorer()
end, { desc = "Project explorer" })
map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "Project explorer" })
map("n", "<M-b>", zed_picker("lsp_symbols", { layout = { preset = "right" } }), { desc = "Outline" })
map("n", "<leader>co", zed_picker("lsp_symbols", { layout = { preset = "right" } }), { desc = "Outline" })
map("n", "<M-g>", zed_picker("git_status", { layout = { preset = "right" } }), { desc = "Git status" })
map("n", "<leader>gs", zed_picker("git_status", { layout = { preset = "right" } }), { desc = "Git status" })
map("n", "<C-M-o>", zed_picker("recent"), { desc = "Open recent" })

map("n", "<C-g>", goto_line, { desc = "Go to line" })
map("n", "<leader>o", zed_picker("lsp_symbols", { layout = { preset = "right" } }), { desc = "Document symbols" })

map("n", "<C-h>", "<C-w>h", { desc = "Focus left pane" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus lower pane" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus upper pane" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus right pane" })

map("n", "<M-h>", split("left"), { desc = "Split left" })
map("n", "<M-j>", split("down"), { desc = "Split down" })
map("n", "<M-k>", split("up"), { desc = "Split up" })
map("n", "<M-l>", split("right"), { desc = "Split right" })

map("n", "<leader>/", function()
  vim.cmd.nohlsearch()
end, { desc = "Clear search highlights" })
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("n", "Q", "@q", { desc = "Replay q macro" })

map("n", "<C-/>", function()
  Snacks.terminal.toggle(nil, { win = { position = "bottom", height = 0.35 } })
end, { desc = "Toggle terminal" })
map("n", "<C-_>", function()
  Snacks.terminal.toggle(nil, { win = { position = "bottom", height = 0.35 } })
end, { desc = "Toggle terminal" })
map("t", "<C-/>", function()
  Snacks.terminal.toggle(nil, { win = { position = "bottom", height = 0.35 } })
end, { desc = "Toggle terminal" })
map("t", "<C-_>", function()
  Snacks.terminal.toggle(nil, { win = { position = "bottom", height = 0.35 } })
end, { desc = "Toggle terminal" })
map("n", "<D-`>", function()
  Snacks.terminal.toggle(nil, { win = { position = "bottom", height = 0.35 } })
end, { desc = "Toggle terminal" })
