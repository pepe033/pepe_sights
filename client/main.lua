ESX = nil
local IsDead = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer 
end)

local used = 0

RegisterNetEvent('pepe_celowniki:celownik')
AddEventHandler('pepe_celowniki:celownik', function(duration)
	local inventory = ESX.GetPlayerData().inventory
	local celownik = 0

		for i=1, #inventory, 1 do
		  if inventory[i].name == 'celownik' then
			celownik = inventory[i].count
		  end
		end

local ped = PlayerPedId()
local currentWeaponHash = GetSelectedPedWeapon(ped)

		if used < celownik then

		  	if currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_02"))  
		  		 ESX.ShowNotification(("~y~Zalozono celownik do broni.")) 
		  			used = used + 1
                
                elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
                    GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MACRO"))  
                    ESX.ShowNotification(("~y~Zalozono celownik do broni.")) 
                        used = used + 1

                elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
                    GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))  
                    ESX.ShowNotification(("~y~Zalozono celownik do broni.")) 
                        used = used + 1

                elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
                    GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))  
                    ESX.ShowNotification(("~y~Zalozono celownik do broni.")) 
                        used = used + 1

                elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
                    GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))  
                    ESX.ShowNotification(("~y~Zalozono celownik do broni.")) 
                        used = used + 1

                elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
                    GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))  
                    ESX.ShowNotification(("~y~Zalozono celownik do broni.")) 
                        used = used + 1

                elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
                    GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))  
                    ESX.ShowNotification(("~y~Zalozono celownik do broni.")) 
                        used = used + 1

                elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
                    GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO"))  
                    ESX.ShowNotification(("~y~Zalozono celownik do broni.")) 
                        used = used + 1 	

		  	else 
		  		  ESX.ShowNotification(("20"))	
			end
			else
					  		 ESX.ShowNotification(("~p~Uzyles juz celownik.~w~/~r~Lub nie pasuje do tej broni.")) 
		end
end)

AddEventHandler('playerSpawned', function()
  used = 0
end)
