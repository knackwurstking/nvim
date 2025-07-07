vim.o.undofile      = true
vim.o.clipboard     = "unnamedplus"
vim.o.laststatus    = 0

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.opt.expandtab   = true
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = 4

vim.opt.mouse = "a"

vim.opt.relativenumber = true

vim.opt.syntax = "enable"

--vim.cmd("syntax off | colorscheme retrobox | highlight Normal guifg=#ffaf00 guibg=#282828")
vim.cmd("colorscheme retrobox | highlight Normal guifg=none guibg=none")

vim.keymap.set('n', '<space>y', function() 
    vim.fn.setreg('+', vim.fn.expand('%:p'))
end)

vim.keymap.set('n', '<space>e', ':Ex<CR>')

vim.keymap.set('n', '<space>gt', ':grep -ie todo: * | copen 10<CR>')

vim.keymap.set('n', '<space>tp', ':tabprevious<CR>')
vim.keymap.set('n', '<space>tn', ':tabnext<CR>')

vim.keymap.set("n", "<space>c", function() 
    vim.ui.input({}, function(c) 
        if c and c~="" then 
            vim.cmd("noswapfile vnew") 
            vim.bo.buftype = "nofile" 
            vim.bo.bufhidden = "wipe"
            vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.systemlist(c)) 
        end 
    end) 
end)

-- TODO: Add some plugin for theese languages
--  * golang
--  * javascript / typescript
--  * css
--  * html
--  * svelte
