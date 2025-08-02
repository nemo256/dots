-- Theme & transparency
vim.cmd("highlight clear")
vim.o.background = "dark"
vim.o.termguicolors = true
vim.api.nvim_set_hl(0, "Normal", { fg = "#c0c0c0", bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#808080", italic = true })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#404040" })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#404040" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#404040" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#808080" })
vim.api.nvim_set_hl(0, "Search", { bg = "#c0c0c0", fg = "#000000" })
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#ffffff", bg = "#404040" })
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#404040" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#c0c0c0", bg = "#404040" })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#ffffff", bg = "#808080" })
vim.api.nvim_set_hl(0, "InputLine", { bg = "#000000" })

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.wrap = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = false
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Visual settings
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.cmdheight = 1
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showmode = false
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 300

-- File handling
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.autoread = true
vim.opt.autowrite = false

-- Behavior settings
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.selection = "exclusive"
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"

-- Cursor settings
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Navigation and keybindings
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
vim.keymap.set("n", "K", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "J", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<C-n>", function()
  vim.cmd("Explore")
end, { noremap = true, silent = true, desc = "Open file explorer" })
vim.keymap.set("n", "<C-x>", ":bd<CR>", { noremap = true, silent = true, desc = "Delete current buffer" })
vim.keymap.set("n", "<C-t>", function()
  local netrw_bufs = vim.tbl_filter(function(b)
    return vim.api.nvim_buf_is_valid(b) and vim.bo[b].filetype == "netrw"
  end, vim.api.nvim_list_bufs())
  if #netrw_bufs > 0 then
    for _, buf in ipairs(netrw_bufs) do
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  else
    vim.cmd("enew")
    vim.cmd("Explore")
  end
end, { noremap = true, silent = true, desc = "Toggle file explorer" })
vim.keymap.set({"n", "v"}, "<C-c>", '"+y', { noremap = true, silent = true, desc = "Copy to system clipboard" })
