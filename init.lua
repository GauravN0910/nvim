vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
local opts = {}
require("lazy").setup("plugins")

vim.keymap.set("n", "<leader>y", ":%y+<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end)

vim.keymap.set("v", "<leader>/", function()
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end)

vim.keymap.set('v', '<leader>c', '"+y', { noremap = true, silent = true })
