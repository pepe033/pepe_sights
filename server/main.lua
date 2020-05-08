

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('celownik', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('pepe_celowniki:use', source, 'celownik')
	xPlayer.removeInventoryItem('celownik', 1)
end)

RegisterServerEvent('pepe_celowniki:giveBack')
AddEventHandler('pepe_celowniki:giveBack', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem(item, 1)
end)

