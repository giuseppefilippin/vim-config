return {
    "mattn/emmet-vim",
    lazy = false,
    config = function()
        vim.g.user_emmet_install_global = 0  -- Não instalar globalmente
        vim.cmd([[
            autocmd FileType html,css EmmetInstall
        ]])
        vim.g.user_emmet_leader_key = "<C-y>" -- Define o líder do Emmet como Ctrl+y
    end,
}

