-- Variables
local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('sceneman', Lang:t("commands.open_scene_manager"), {}, false, function(source, _)
  TriggerClientEvent('scene-manager:client:openMenu', source)
end, 'sceneman')

RegisterNetEvent('scene-manager:server:densityChanged', function(value, type)
  local src = source
  TriggerClientEvent('QBCore:Notify', src, Lang:t("notifications.density_changed", {newDensity = value, type = type}), 'success', 5000)
end)

RegisterNetEvent('scene-manager:server:removeAll', function(type)
  local coordFrom = GetEntityCoords(GetPlayerPed(source)) -- Get the position of the source.
  local info = {} -- Save a table so we can add the info here.
  if type == 'vehicles' then
    for k,v in pairs(GetAllVehicles()) do -- Do a loop of all the known server-side objects.
        local objCoord = GetEntityCoords(v) -- Get the coord of the object found
        local dist = #(coordFrom - objCoord) -- Find the distance
        if dist < 500 and DoesEntityExist(v) then -- A little check here to make sure stuff doesn't break
        --  SetEntityAsMissionEntity(v, true, true)
          DeleteEntity(v) -- Delete the entity
        end
    end
  else
    for k,v in pairs(GetAllPeds()) do -- Do a loop of all the known server-side objects.
        local objCoord = GetEntityCoords(v) -- Get the coord of the object found
        local dist = #(coordFrom - objCoord) -- Find the distance
        if dist < 500 and DoesEntityExist(v) then -- A little check here to make sure stuff doesn't break
        --  SetEntityAsMissionEntity(v, true, true)
          DeleteEntity(v) -- Delete the entity
        end
    end
  end
  TriggerClientEvent('QBCore:Notify', source, Lang:t("notifications.entities_removed", {type = type}), 'success', 5000)
end)

