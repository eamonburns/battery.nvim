-- https://www.nerdfonts.com/cheat-sheet?q=battery

local M = {}

---@alias battery.IconSet { [1]: string, [2]: integer }[]

---@type table<string, battery.IconSet>
M.sets = {
  plain = {
    { '󰁺', 10 }, -- nf-md-battery_10.
    { '󰁻', 20 }, -- nf-md-battery_20
    { '󰁼', 30 }, -- nf-md-battery_30
    { '󰁽', 40 }, -- nf-md-battery_40
    { '󰁾', 50 }, -- nf-md-battery_50
    { '󰁿', 60 }, -- nf-md-battery_60
    { '󰂀', 70 }, -- nf-md-battery_70
    { '󰂁', 80 }, -- nf-md-battery_80
    { '󰂂', 90 }, -- nf-md-battery_90
    { '󰁹', 100 }, -- nf-md-battery
  },

  plain_charging = {
    { '󰢜', 10 }, -- nf-md-battery_charging_10
    { '󰂆', 20 }, -- nf-md-battery_charging_20
    { '󰂇', 30 }, -- nf-md-battery_charging_30
    { '󰂈', 40 }, -- nf-md-battery_charging_40
    { '󰢝', 50 }, -- nf-md-battery_charging_50
    { '󰂉', 60 }, -- nf-md-battery_charging_60
    { '󰢞', 70 }, -- nf-md-battery_charging_70
    { '󰂊', 80 }, -- nf-md-battery_charging_80
    { '󰂋', 90 }, -- nf-md-battery_charging_90
    { '󰂅', 100 }, -- nf-md-battery_charging_100
  },

  plain_charging_wireless = {
    { '󰠒', 5 }, -- nf-md-battery_charging_wireless_outline
    { '󰠈', 10 }, -- nf-md-battery_charging_wireless_10
    { '󰠉', 20 }, -- nf-md-battery_charging_wireless_20
    { '󰠊', 30 }, -- nf-md-battery_charging_wireless_30
    { '󰠋', 40 }, -- nf-md-battery_charging_wireless_40
    { '󰠌', 50 }, -- nf-md-battery_charging_wireless_50
    { '󰠍', 60 }, -- nf-md-battery_charging_wireless_60
    { '󰠎', 70 }, -- nf-md-battery_charging_wireless_70
    { '󰠏', 80 }, -- nf-md-battery_charging_wireless_80
    { '󰠐', 90 }, -- nf-md-battery_charging_wireless_90
    { '󰠇', 100 }, -- nf-md-battery_charging_wireless
  },

  plain_bluetooth = {
    { '󰤾', 10 }, -- nf-md-battery_10_bluetooth
    { '󰤿', 20 }, -- nf-md-battery_20_bluetooth
    { '󰥀', 30 }, -- nf-md-battery_30_bluetooth
    { '󰥁', 40 }, -- nf-md-battery_40_bluetooth
    { '󰥂', 50 }, -- nf-md-battery_50_bluetooth
    { '󰥃', 60 }, -- nf-md-battery_60_bluetooth
    { '󰥄', 70 }, -- nf-md-battery_70_bluetooth
    { '󰥅', 80 }, -- nf-md-battery_80_bluetooth
    { '󰥆', 90 }, -- nf-md-battery_90_bluetooth
    { '󰥈', 100 }, -- nf-md-battery_bluetooth
  },

  horizontal = {
    { '', 5 }, -- nf-fa-battery_0
    { '', 25 }, -- nf-fa-battery_1
    { '', 50 }, -- nf-fa-battery_2
    { '', 75 }, -- nf-fa-battery_3
    { '', 100 }, -- nf-fa-battery_4
  },

  bars = {
    { '󱊡', 33 }, -- nf-md-battery_low
    { '󱊢', 66 }, -- nf-md-battery_medium
    { '󱊣', 100 }, -- nf-md-battery_high
  },

  bars_charging = {
    { '󱊤', 33 }, -- nf-md-battery_charging_low
    { '󱊥', 66 }, -- nf-md-battery_charging_medium
    { '󱊦', 100 }, -- nf-md-battery_charging_high
  },
}

M.specific = {
  plugged = '󰚥',
  unplugged = '󰚦',
  no_battery = '󰇅',
  no_battery_classic = '󰟀',
  unknown = '󰂑',
}

---Convert percentage charge to icon given a table of icons
---and max charge for that icon
---@param p integer
---@param icon_table battery.IconSet
---@return string
function M.icon_for_percentage(p, icon_table)
  for _, icon in ipairs(icon_table) do
    if tonumber(p) <= tonumber(icon[2]) then
      return icon[1]
    end
  end
  vim.notify('No icon found for percentage ' .. p)
  return '!'
end

---@param p integer
---@return string
function M.discharging_battery_icon_for_percent(p)
  return M.icon_for_percentage(p, M.sets.plain)
end

---@param p integer
---@return string
function M.horizontal_battery_icon_for_percent(p)
  return M.icon_for_percentage(p, M.sets.horizontal)
end

return M
