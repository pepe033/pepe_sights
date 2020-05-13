local ESX = nil
local weapons = {
    [GetHashKey('WEAPON_SMG')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_MACRO_02')},
    [GetHashKey('WEAPON_ASSAULTSMG')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_MACRO')},
    [GetHashKey('WEAPON_ASSAULTRIFLE')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_MACRO')},
    [GetHashKey('WEAPON_CARBINERIFLE')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')},
    [GetHashKey('WEAPON_ADVANCEDRIFLE')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_SMALL')},
    [GetHashKey('WEAPON_SPECIALCARBINE')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')},
    [GetHashKey('WEAPON_BULLPUPRIFLE')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_SMALL')},
    [GetHashKey('WEAPON_SNSPISTOL_MK2')] = { celownik = GetHashKey('COMPONENT_AT_PI_RAIL_02')},
    [GetHashKey('WEAPON_PISTOL_MK2')] = { celownik = GetHashKey('COMPONENT_AT_PI_RAIL')},
    [GetHashKey('WEAPON_SMG_MK2')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2')},
    [GetHashKey('WEAPON_PUMPSHOTGUN_MK2')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2')},   
    [GetHashKey('WEAPON_BULLPUPRIFLE_MK2')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_MACRO_02_MK2')},   
    [GetHashKey('WEAPON_SPECIALCARBINE_MK2')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2')},
    [GetHashKey('WEAPON_ASSAULTRIFLE_MK2')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2')}, 
    [GetHashKey('WEAPON_CARBINERIFLE_MK2')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2')}, 
    [GetHashKey('WEAPON_COMBATMG')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')}, 
    [GetHashKey('WEAPON_COMBATMG_MK2')] = { celownik = GetHashKey('COMPONENT_AT_SIGHTS')}, 
    [GetHashKey('WEAPON_COMBATPDW')] = { celownik = GetHashKey('COMPONENT_AT_SCOPE_SMALL')}
}

-- ESX
Citizen.CreateThread(function()
  while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
  end
end)

-- ESX, playerloaded
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

-- Use item
RegisterNetEvent('pepe_celowniki:use')
AddEventHandler('pepe_celowniki:use', function( type )
  if weapons[GetSelectedPedWeapon(PlayerPedId())] and weapons[GetSelectedPedWeapon(PlayerPedId())][type] then
      if not HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type]) then
          GiveWeaponComponentToPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])  
          ESX.ShowNotification(string.format('%s %s', "You used your", type))
      else
          RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])  
          ESX.ShowNotification(string.format('%s %s', "You removed your ", type))
      end
  else
      ESX.ShowNotification(string.format('%s %s %s', 'This ', type, " doesn't fit on your weapon.."))
  end
end)

Citizen.CreateThread(function()
while true do
  Citizen.Wait(0)
  if IsControlJustPressed(0, 121) then
    if weapons[GetSelectedPedWeapon(PlayerPedId())] then
      for k,v in pairs(weapons) do
        if GetSelectedPedWeapon(PlayerPedId()) == k then
          if HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.celownik) then
            TriggerServerEvent('pepe_celowniki:giveBack', 'celownik')
            ESX.ShowNotification("You removed your Sight")
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.celownik)
          
          end
        end
      end
    end
  end
end
end)
