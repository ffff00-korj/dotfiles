return {
  'aveplen/ruscmd.nvim',
  keys = { { "й", mode = { "n", "v" } } }, -- Быстрая ленивая загрузка
  config = function()
    require('ruscmd').setup({
      abbreviations = true, -- Разрешает команды типа `:й` вместо `:q`
      keymaps = true,       -- Включает перевод клавиш в Normal-режиме
    })
  end
}
