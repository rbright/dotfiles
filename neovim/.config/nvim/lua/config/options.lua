local function first_executable(...)
  for _, bin in ipairs({ ... }) do
    local path = vim.fn.exepath(bin)
    if path ~= "" then
      return path
    end
  end
end

local function has_env(name)
  return vim.env[name] and vim.env[name] ~= ""
end

local function configure_clipboard()
  local needs_osc52 = has_env("SSH_TTY")
    or has_env("SSH_CONNECTION")
    or has_env("TMUX")
    or (
      not has_env("WAYLAND_DISPLAY")
      and not has_env("DISPLAY")
      and vim.fn.exepath("pbcopy") == ""
      and vim.fn.exepath("win32yank.exe") == ""
      and vim.fn.exepath("clip.exe") == ""
      and vim.fn.exepath("termux-clipboard-set") == ""
    )

  if needs_osc52 then
    vim.g.clipboard = "osc52"
  end

  vim.opt.clipboard:append("unnamedplus")
end

vim.opt.termguicolors = true
vim.opt.winborder = "rounded"

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.copyindent = true
vim.opt.breakindent = true

vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.endofline = true
vim.opt.fileencoding = "utf-8"
vim.opt.fixeol = true
vim.opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "",
  foldclose = "",
  foldsep = " ",
  diff = "╱",
}
vim.opt.formatoptions = "jcroqlnt"
vim.opt.gdefault = true
vim.opt.hidden = true
vim.opt.history = 1000
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = {
  tab = "▸ ",
  trail = "·",
  nbsp = "␣",
  extends = "›",
  precedes = "‹",
}
vim.opt.modelines = 0
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.pumblend = 10
vim.opt.pumheight = 12
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 6
vim.opt.shiftround = true
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200
vim.opt.wildignore = { "*.bak", "*.class", "*.pyc", "*.swp" }
vim.opt.wildmode = { "longest", "full" }
vim.opt.wrap = false

configure_clipboard()

local shell = first_executable("bash", "zsh", "sh")
if shell then
  vim.opt.shell = shell
end

vim.g.python3_host_prog = vim.fn.exepath("python3") ~= "" and vim.fn.exepath("python3") or nil

vim.cmd.colorscheme("catppuccin")
