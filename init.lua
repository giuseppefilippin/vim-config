local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<leader>r",
      ":w<CR>:!python3 %<CR>",
      { noremap = true, silent = true }
    )
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<leader>r",
      ":w<CR>:!cd %:p:h && javac %:t && java %:t:r<CR>",
      { noremap = true, silent = true }
    )
  end,
})

