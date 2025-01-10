  return {
  "mattn/emmet-vim", -- Plugin Emmet
  config = function()
    -- Configurações adicionais do Emmet
    vim.g.user_emmet_leader_key = '<C-Y>' -- Define Ctrl + Y como atalho
    vim.g.user_emmet_install_global = 0 -- Desabilita instalação global para otimizar o desempenho

    -- Adiciona a linha `<meta name="viewport"...>` no snippet `!`
    vim.g.user_emmet_settings = {
      html = {
        snippets = {
          ["!"] = "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta charset=\"UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title></title>\n</head>\n<body>\n\n</body>\n</html>"
        }
      }
    }

    -- Ativa o Emmet apenas para os tipos de arquivo abaixo
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "html", "css", "javascriptreact", "typescriptreact" },
      callback = function()
        vim.cmd([[EmmetInstall]]) -- Comando para ativar o Emmet no arquivo atual
      end,
    })
  end,
}

