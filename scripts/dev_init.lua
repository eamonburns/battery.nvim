if vim.env.DEV_SHELL ~= 'battery.nvim' then
  -- TODO: Calculate dev-shell script that should be run based
  -- on platform (Linux/MacOS: dev-shell.sh, Windows: DevShell.ps1)
  vim.notify(
    '  Not in battery.nvim dev-shell, exiting dev_init.lua early.\n'
      .. '  Source scripts/dev-shell.sh to enter dev-shell.',
    vim.log.levels.ERROR
  )
  return
end

vim.cmd.packadd('battery.nvim')

require('battery').setup({})

BatteryStatus = require('battery').get_battery_status
BatteryStatusLine = require('battery').get_status_line
