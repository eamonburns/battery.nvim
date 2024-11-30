local M = {}

local icons = require('battery.icons')

---Format specifiers:
---%b = Regular battery icon
---%h = Horizontal battery icon
---%f = Fancy battery icon (unimplemented)
---%c = Battery count
---%p = Percent of charge
---%u = Plugged/unplugged icon
---%U = Plugged/unplugged icon (no icon when unplugged)
---%% = Literal %
---@param fmt string
---@param status BatteryStatus
---@return string
function M.format_status(fmt, status)
  local formatted = ''
  local i = 1
  while i <= fmt:len() do
    local idx = fmt:find('%%', i)
    -- Check to see if there is another specifier
    if idx then
      -- Append the format string from after the last format
      -- specifier to before the current one
      formatted = formatted .. fmt:sub(i, idx - 1)
      -- The next character is the format specifier
      local specifier = fmt:sub(idx + 1, idx + 1)
      if specifier == 'b' then
        formatted = formatted .. icons.discharging_battery_icon_for_percent(status.percent_charge_remaining)
      elseif specifier == 'h' then
        formatted = formatted .. icons.horizontal_battery_icon_for_percent(status.percent_charge_remaining)
      elseif specifier == 'f' then
        formatted = formatted .. '<wip>'
      elseif specifier == 'c' then
        formatted = formatted .. (status.battery_count or '0')
      elseif specifier == 'p' then
        formatted = formatted .. (status.percent_charge_remaining or '0')
      elseif specifier == 'u' then
        formatted = formatted .. (
          status.ac_power
          and icons.specific.plugged
          or icons.specific.unplugged
        )
      elseif specifier == 'U' then
        formatted = formatted .. (
          status.ac_power
          and icons.specific.plugged
          or ''
        )
      elseif specifier == '%' then
        formatted = formatted .. '%'
      else
        formatted = formatted .. '<unknown>'
      end
      i = idx + 2 -- Skip % and the specifier
    else
      -- There are no more format specifiers to process
      -- Append the rest of the format string
      formatted = formatted .. fmt:sub(i)
      break
    end
  end
  return formatted
end

return M
