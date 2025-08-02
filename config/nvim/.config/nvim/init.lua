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
vim.keymap.set("n", "K", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "J", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", function()
  local new_buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_set_current_buf(new_buf)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", function()
  local netrw_bufs = vim.tbl_filter(function(b)
    return vim.api.nvim_buf_is_valid(b) and vim.bo[b].filetype == "netrw"
  end, vim.api.nvim_list_bufs())
  if #netrw_bufs > 0 then
    for _, buf in ipairs(netrw_bufs) do
      local win_ids = vim.api.nvim_list_wins()
      for _, win in ipairs(win_ids) do
        if vim.api.nvim_win_get_buf(win) == buf then
          vim.api.nvim_win_close(win, true)
        end
      end
    end
  else
    local width = math.floor(vim.o.columns * 0.25)
    vim.cmd(width .. "vsplit | wincmd H | Ex")
    vim.api.nvim_buf_set_keymap(0, "n", "<CR>", ":e <C-R>=expand('%:p')<CR><CR>", { noremap = true, silent = true })
  end
end, { noremap = true, silent = true })

-- Window management
local function window(config)
  local buf = config.buf or vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * (config.width or 0.6))
  local height = math.min(config.height or 1, math.floor(vim.o.lines * 0.8))
  local row = math.ceil((vim.o.lines - height) / 2 - 2)
  local col = math.floor((vim.o.columns - width) / 2)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "single",
  })
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_win_set_option(win, "cursorline", true)
  if config.prompt then
    vim.api.nvim_buf_set_option(buf, "buftype", "prompt")
    vim.api.nvim_buf_set_option(buf, "filetype", "prompt")
    vim.fn.prompt_setprompt(buf, " ")
    if config.callback then vim.fn.prompt_setcallback(buf, config.callback) end
  end
  if config.lines then vim.api.nvim_buf_set_lines(buf, 0, -1, false, config.lines) end
  if config.highlight then vim.api.nvim_buf_add_highlight(buf, -1, config.highlight, 0, 0, -1) end
  local function close()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
    return false
  end
  vim.keymap.set({"n", "i"}, "<Esc>", close, { buffer = buf, noremap = true, silent = true })
  return { buf = buf, win = win, close = close }
end

-- Buffer list
local function show_buffer_list()
  local buffers = vim.api.nvim_list_bufs()
  local buf_info = {}
  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
      local name = vim.api.nvim_buf_get_name(buf)
      name = name ~= "" and vim.fn.fnamemodify(name, ":t") or "[No Name]"
      table.insert(buf_info, { id = buf, line = string.format("%d: %s", buf, name) })
    end
  end
  local w = window({ height = #buf_info + 2, lines = vim.tbl_map(function(b) return b.line end, buf_info) })
  vim.keymap.set("n", "<CR>", function()
    local line = vim.api.nvim_get_current_line()
    local buf_nr = tonumber(line:match("^%d+"))
    if buf_nr then
      w.close()
      vim.api.nvim_set_current_buf(buf_nr)
    end
  end, { buffer = w.buf, noremap = true, silent = true })
  vim.keymap.set("n", "x", function()
    local line = vim.api.nvim_get_current_line()
    local buf_nr = tonumber(line:match("^%d+"))
    if buf_nr and vim.api.nvim_buf_is_valid(buf_nr) then
      vim.api.nvim_buf_delete(buf_nr, { force = true })
      vim.api.nvim_buf_set_lines(w.buf, 0, -1, false, {})
      local new_buf_info = {}
      for _, b in ipairs(buf_info) do
        if b.id ~= buf_nr and vim.api.nvim_buf_is_valid(b.id) then
          table.insert(new_buf_info, b.line)
        end
      end
      vim.api.nvim_buf_set_lines(w.buf, 0, -1, false, new_buf_info)
      vim.api.nvim_win_set_config(w.win, { height = #new_buf_info + 2 })
    end
  end, { buffer = w.buf, noremap = true, silent = true })
end

-- File search
local function search_files()
  local files = vim.fn.systemlist("ag -g ''")
  local filtered_files = {}
  local selected_idx = 1
  local w_input = window({ height = 1, lines = {" "}, highlight = "InputLine", prompt = true, callback = function(query)
    filtered_files = {}
    query = query:sub(2):lower()
    for i, file in ipairs(files) do
      if i > 5 then break end
      if string.match(file:lower(), query) then
        table.insert(filtered_files, file)
      end
    end
    if w_result and w_result.close() then w_result = nil end
    if #filtered_files > 0 then
      w_result = window({ height = #filtered_files, lines = filtered_files })
      for i = 0, #filtered_files - 1 do
        vim.api.nvim_buf_add_highlight(w_result.buf, -1, i + 1 == selected_idx and "PmenuSel" or "Pmenu", i, 0, -1)
      end
      vim.keymap.set("n", "j", function()
        if selected_idx < #filtered_files then
          selected_idx = selected_idx + 1
          vim.api.nvim_win_set_cursor(w_result.win, {selected_idx, 0})
          for i = 0, #filtered_files - 1 do
            vim.api.nvim_buf_add_highlight(w_result.buf, -1, i + 1 == selected_idx and "PmenuSel" or "Pmenu", i, 0, -1)
          end
        end
      end, { buffer = w_result.buf, noremap = true, silent = true })
      vim.keymap.set("n", "k", function()
        if selected_idx > 1 then
          selected_idx = selected_idx - 1
          vim.api.nvim_win_set_cursor(w_result.win, {selected_idx, 0})
          for i = 0, #filtered_files - 1 do
            vim.api.nvim_buf_add_highlight(w_result.buf, -1, i + 1 == selected_idx and "PmenuSel" or "Pmenu", i, 0, -1)
          end
        end
      end, { buffer = w_result.buf, noremap = true, silent = true })
      vim.keymap.set("n", "<CR>", function()
        local file = filtered_files[selected_idx]
        if file then
          w_input.close()
          w_result.close()
          vim.cmd("edit " .. vim.fn.fnameescape(file))
        end
      end, { buffer = w_result.buf, noremap = true, silent = true })
      vim.keymap.set({"n", "i"}, "<Esc>", function()
        w_input.close()
        w_result.close()
      end, { buffer = w_result.buf, noremap = true, silent = true })
    end
  end})
  local w_result = nil
  vim.keymap.set("i", "<Tab>", function()
    if #filtered_files > 0 then
      selected_idx = (selected_idx % #filtered_files) + 1
      vim.api.nvim_buf_set_lines(w_input.buf, 0, -1, false, {" " .. filtered_files[selected_idx]})
      if w_result then
        for i = 0, #filtered_files - 1 do
          vim.api.nvim_buf_add_highlight(w_result.buf, -1, i + 1 == selected_idx and "PmenuSel" or "Pmenu", i, 0, -1)
        end
      end
    end
  end, { buffer = w_input.buf, noremap = true, silent = true })
  vim.keymap.set("i", "<CR>", function()
    local file = filtered_files[selected_idx]
    if file then
      w_input.close()
      if w_result then w_result.close() end
      vim.cmd("edit " .. vim.fn.fnameescape(file))
    else
      w_input.close()
      if w_result then w_result.close() end
    end
  end, { buffer = w_input.buf, noremap = true, silent = true })
  vim.api.nvim_command("startinsert")
end

-- Command input
local function command_input()
  local w = window({ height = 1, lines = {" "}, highlight = "InputLine", prompt = true })
  vim.keymap.set("i", "<Tab>", "<C-n>", { buffer = w.buf, noremap = true, silent = true })
  vim.keymap.set("i", "<CR>", function()
    local cmd = vim.api.nvim_buf_get_lines(w.buf, 0, 1, false)[1]:sub(2)
    w.close()
    if cmd ~= "" then vim.cmd(cmd) end
  end, { buffer = w.buf, noremap = true, silent = true })
  vim.api.nvim_command("startinsert")
end

-- Keybindings for floating windows
vim.keymap.set("n", "<C-b>", show_buffer_list, { noremap = true, silent = true })
vim.keymap.set("n", "<C-f>", search_files, { noremap = true, silent = true })
vim.keymap.set("n", ":", command_input, { noremap = true, silent = true })
