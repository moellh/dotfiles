-- adds (relative) line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- splitting to right or below (not left or aboth)
vim.opt.splitbelow = true
vim.opt.splitright = true

-- no text-wrapping
vim.opt.wrap = false

-- tabs are converted to 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- "" is automatically synced with "+
vim.opt.clipboard = "unnamedplus"

-- cursor stays in middle row if possible
vim.opt.scrolloff = 999

-- visual-block mode treats out-of-file cells as spaces
vim.opt.virtualedit = "block"

-- <leader> key
vim.g.mapleader = " "

-- global subsitution command shows each line in split window
vim.opt.inccommand = "split"

-- commands ignore case
vim.opt.ignorecase = true

-- enable all ui colors
vim.opt.termguicolors = true

-- shows block in Insert-Mode as cursor
vim.opt.guicursor = ""

-- highlights line of cursor and 81 & 121 column
vim.api.nvim_exec([[set colorcolumn=81,121]], false)
vim.api.nvim_exec([[set cursorline]], false)

-- auto newline for markdown files after column 80
vim.opt.textwidth = 80
vim.api.nvim_exec([[set formatoptions-=t]], false)
vim.api.nvim_exec([[au BufRead,BufNewFile *.md setlocal textwidth=80]], false)
