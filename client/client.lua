local density =  exports['qb-smallresources']:GetDecorSet()
local menuLocation = 'topright'

local menu2 = MenuV:CreateMenu(false, Lang:t("menu.ped_density_options"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test2')

RegisterNetEvent('scene-manager:client:openMenu', function()
  MenuV:OpenMenu(menu2)
end)

--[[
    Scene Main menu buttons
--]]

local vehiculesDensityValue = menu2:AddRange({ icon = '🚗', label = Lang:t("menu.vehicule_density_option"), min = 0, max = 10, value = density['vehicle']*10})
-- Adjust time on change
vehiculesDensityValue:On("select", function(_, value)
  local newDensity = value/10
  exports['qb-smallresources']:DecorSet('vehicle', newDensity)
  local src = source
  TriggerServerEvent("scene-manager:server:densityChanged", newDensity, 'vehicules')
end)

local parkedVehiculesDensityValue = menu2:AddRange({ icon = '🅿️', label = Lang:t("menu.parked_vehicule_density_option"), min = 0, max = 10, value = density['parked']*10})
-- Adjust time on change
parkedVehiculesDensityValue:On("select", function(_, value)
  local newDensity = value/10
  exports['qb-smallresources']:DecorSet('parked', newDensity)
  local src = source
  TriggerServerEvent("scene-manager:server:densityChanged", newDensity, 'parked vehicules')
end)

local pedDensityValue = menu2:AddRange({ icon = '🏃', label = Lang:t("menu.ped_density_option"), min = 0, max = 10, value = density['peds']*10})
-- Adjust time on change
pedDensityValue:On("select", function(_, value)
  local newDensity = value/10
  exports['qb-smallresources']:DecorSet('peds', newDensity)
  local src = source
  TriggerServerEvent("scene-manager:server:densityChanged", newDensity, 'peds')
end)

local scenarioPedDensityValue = menu2:AddRange({ icon = '👨‍💻', label = Lang:t("menu.scenario_density_option"), min = 0, max = 10, value = density['scenario']*10})
-- Adjust time on change
scenarioPedDensityValue:On("select", function(_, value)
  local newDensity = value/10
  exports['qb-smallresources']:DecorSet('scenario', newDensity)
  local src = source
  TriggerServerEvent("scene-manager:server:densityChanged", newDensity, 'scenario')
end)

local multiplierDensityValue = menu2:AddRange({ icon = '👨‍👩‍👧‍👦', label = Lang:t("menu.multiplier_density_option"), min = 0, max = 10, value = density['multiplier']*10})
-- Adjust time on change
multiplierDensityValue:On("select", function(_, value)
  local newDensity = value/10
  exports['qb-smallresources']:DecorSet('multiplier', newDensity)
  local src = source
  TriggerServerEvent("scene-manager:server:densityChanged", newDensity, 'multiplier')
end)

local removeVehiculesFromScene = menu2:AddButton({
  icon = '⛔',
  label = Lang:t("menu.remove_all_vehicles"),
  value = nil,
  description = Lang:t("menu.remove_all_vehicles_description"),
  select = function(btn)
    TriggerServerEvent("scene-manager:server:removeAll", 'vehicles')
  end
})

local removePedsVehiculesFromScene = menu2:AddButton({
  icon = '⛔',
  label = Lang:t("menu.remove_all_peds"),
  value = nil,
  description = Lang:t("menu.remove_all_peds_description"),
  select = function(btn)
    TriggerServerEvent("scene-manager:server:removeAll", 'peds')
  end
})
