

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('celownik', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
		
    TriggerClientEvent('pepe_celowniki:celownik', source)
end)

