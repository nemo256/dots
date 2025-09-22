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

-- Custom UI functions
local function buffer_select()
  local bufs = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(buf) == 1 then
      local name = vim.api.nvim_buf_get_name(buf)
      if name == "" then
        name = "[No Name]"
      else
        name = vim.fn.fnamemodify(name, ":t")
      end
      table.insert(bufs, { buf = buf, name = name })
    end
  end
  if #bufs == 0 then
    print("No buffers available")
    return
  end
  local lines = {}
  local max_len = 0
  for _, item in ipairs(bufs) do
    local line = string.format("%d: %s", item.buf, item.name)
    table.insert(lines, line)
    max_len = math.max(max_len, #line)
  end
  local height = math.min(#lines, math.floor(vim.o.lines * 0.6))
  local width = math.min(max_len + 4, math.floor(vim.o.columns * 0.8))
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = (vim.o.lines - height) / 2 - 1,
    style = "minimal",
    border = "single",
    title = " 📋 ",
    title_pos = "center",
  }
  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.api.nvim_buf_set_keymap(buf, "n", "<CR>", "", {
    noremap = true,
    silent = true,
    callback = function()
      local ln = vim.api.nvim_win_get_cursor(win)[1]
      local choice = bufs[ln]
      vim.api.nvim_win_close(win, true)
      if choice then
        vim.api.nvim_set_current_buf(choice.buf)
      end
    end,
  })
  vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "", {
    noremap = true,
    silent = true,
    callback = function()
      vim.api.nvim_win_close(win, true)
    end,
  })
end

local function custom_command()
  local prompt = " "
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {prompt})
  local width = 80
  local height = 1
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = (vim.o.lines - height) / 2,
    style = "minimal",
    border = "single",
    title = " 󰘳  ",
    title_pos = "center",
  }
  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.api.nvim_win_set_cursor(win, {1, #prompt + 1})
  vim.cmd("startinsert!")
  vim.api.nvim_buf_set_keymap(buf, "i", "<CR>", "<Esc>", { noremap = true, silent = true })
  vim.api.nvim_create_autocmd("InsertLeave", {
    buffer = buf,
    once = true,
    callback = function()
      local input = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] or ""
      input = input:sub(#prompt + 1):gsub("^%s+", "")
      vim.api.nvim_win_close(win, true)
      if input ~= "" then
        pcall(vim.cmd, input)
      end
    end,
  })
  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = buf,
    once = true,
    callback = function()
      vim.api.nvim_win_close(win, true)
    end,
  })
end

-- Keybindings
vim.keymap.set("n", "<C-S-s>", ":mksession! ~/.config/nvim/_root_.vim<CR>")
vim.keymap.set("n", "<C-S-d>", ":!rm ~/.config/nvim/_root_.vim<CR>")
vim.keymap.set("n", "<C-S-l>", ":source ~/.config/nvim/_root_.vim<CR>")
vim.keymap.set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<C-x>", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<C-S-c>", ":w<CR>:! clear && cc %:p -o %:p:r -lm<CR>", { silent = true })
vim.keymap.set("n", "<C-S-r>", "<cmd>! %:p:r<cr>", { silent = true })
vim.keymap.set("n", "<C-p>", ":w<CR>:! clear && pdflatex -output-directory %:p:h %:p<CR>", { silent = true })
vim.keymap.set("n", "<C-S-b>", ":w<cr>:!clear && cd %:p:h && bibtex %:t:r<cr>", { silent = true })
vim.keymap.set("n", "<C-S-p>", "<cmd>! zathura $(echo % | sed 's/tex$/pdf/') & disown<CR><CR>", { silent = true })
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
vim.keymap.set("n", "<C-b>", buffer_select, { noremap = true, silent = true, desc = "Select buffer" })
vim.keymap.set({ "n", "v" }, ":", custom_command, { noremap = true, silent = true, desc = "Custom command input" })
