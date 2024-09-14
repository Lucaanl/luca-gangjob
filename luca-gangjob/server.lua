ESX = exports["es_extended"]:getSharedObject() -- ESX export, niet aan zitten.


----------------- GANGKLUIS ------------------
local stash = {
    id = Luca.Kluis.gangKluisId,
    label = 'Gangkluis',
    slots = 40,
    weight = Luca.Kluis.weight,
    owner = false
}

AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
        exports.ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight, stash.owner)
    end
end)
----------------- GANGKLUIS ------------------

-------------------- WAPENINKOOP ----------------------
RegisterNetEvent('giveWeapon')
AddEventHandler('giveWeapon', function(weaponName, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == Luca.Job then
        exports.ox_inventory:RemoveItem(source, 'money', price)
        exports.ox_inventory:AddItem(source, weaponName, 1)
    end
end)

RegisterNetEvent('giveAmmo')
AddEventHandler('giveAmmo', function(ammoName, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == Luca.job then
        exports.ox_inventory:RemoveItem(source, 'money', price)
        exports.ox_inventory:AddItem(source, ammoName, 50)
    end
end)
-------------------- WAPENINKOOP ----------------------

--------------------------- WITWAS --------------------------------
RegisterNetEvent('witwas')
AddEventHandler('witwas', function(blackMoney)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == Luca.job then
        exports.ox_inventory:RemoveItem(source, 'black_money', blackMoney)
        exports.ox_inventory:AddItem(source, 'money', blackMoney * Luca.Witwas.percentageAfterDeduction)
    end
end)
--------------------------- WITWAS --------------------------------
