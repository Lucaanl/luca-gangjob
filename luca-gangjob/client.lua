ESX = exports["es_extended"]:getSharedObject() -- ESX export, dont touch

-- Gangkluis
CreateThread(function()
    while true do
        local sleep = 1000
        local playerCoords = GetEntityCoords(PlayerPedId())
        if #(playerCoords - Luca.Kluis.coords) < 5.0 and ESX.PlayerData.job.name == Luca.Job then
            sleep = 0
            DrawMarker(2, Luca.Kluis.coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 52, 64, 235, 222, true, false, 2,
                true,
                nil, nil, false)

            lib.showTextUI('[E] - Open Gangkluis ', { position = "top-center" })




            if IsControlJustReleased(0, 38) and ESX.PlayerData.job.name == Luca.Job then -- E key
                lib.progressCircle({
                    label = 'Gangkluis openen',
                    duration = 3000,
                    position = 'bottom',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                    },
                    anim = {
                        dict = 'amb@prop_human_parking_meter@male@idle_a',
                        clip = 'idle_a'
                    },
                })
                exports.ox_inventory:openInventory('stash', Luca.Kluis.gangKluisId)
            end
        else
            lib.hideTextUI()
        end

        Wait(sleep)
    end
end)

------------------------ WAPENINKOOP ------------------------------
lib.registerContext({
    id = 'wapeninkoop',
    title = 'Wapeninkoop',
    options = {
        {
            title = 'Wapens',
            description = 'Bemachtig Wapens',
            icon = 'gun',
            menu = 'wapens'
        },
        {
            title = 'Munitie',
            description = 'Bemachtig Munitie',
            icon = 'person-rifle',
            menu = 'munitie'
        }
    }
})

lib.registerContext({
    id = 'wapens',
    title = 'Wapens',
    options = {
        {
            title = 'M1911',
            icon = 'gun',
            onSelect = function()
                TriggerServerEvent('giveWeapon', 'WEAPON_PISTOL', 1000) -- Om nieuw wapen toe te voegen gewoon itemname hier doen en prijs passen
            end
        },
        {
            title = 'Assaultrifle',
            icon = 'gun',
            onSelect = function()
                TriggerServerEvent('giveWeapon', 'WEAPON_ASSAULTRIFLE', 1000)
            end
        }
    }

})

lib.registerContext({
    id = 'munitie',
    title = 'Munitie',
    options = {
        {
            title = '5.56x45 (50)',
            icon = 'person-rifle',
            onSelect = function()
                TriggerServerEvent('giveAmmo', 'ammo-rifle', 1000)
            end
        }
    }
})


CreateThread(function()
    while true do
        local sleep = 1000
        local playerCoords = GetEntityCoords(PlayerPedId())
        if #(playerCoords - Luca.WapenInkoop.coords) < 5.0 and ESX.PlayerData.job.name == Luca.Job then
            sleep = 0
            DrawMarker(2, Luca.WapenInkoop.coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 52, 64, 235, 222, true,
                false, 2,
                true,
                nil, nil, false)

            lib.showTextUI('[E] - Open Wapeninkoop ', { position = "top-center" })




            if IsControlJustReleased(0, 38) and ESX.PlayerData.job.name == Luca.Job then -- E key
                lib.progressCircle({
                    label = 'Wapens inkopen',
                    duration = 3000,
                    position = 'bottom',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                    },
                    anim = {
                        dict = 'amb@prop_human_parking_meter@male@idle_a',
                        clip = 'idle_a'
                    },
                })
                lib.showContext('wapeninkoop')
            end
        else
            lib.hideTextUI()
        end

        Wait(sleep)
    end
end)
------------------------ WAPENINKOOP ------------------------------

------------------------ WITWAS -----------------------------------
CreateThread(function()
    while true do
        local sleep = 1000
        local blackMoney = exports.ox_inventory:GetItemCount('black_money')
        local playerCoords = GetEntityCoords(PlayerPedId())
        if #(playerCoords - Luca.Witwas.coords) < 5.0 and ESX.PlayerData.job.name == Luca.Job then
            sleep = 0
            DrawMarker(2, Luca.Witwas.coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 52, 64, 235, 222, true,
                false, 2,
                true,
                nil, nil, false)

            lib.showTextUI('[E] - Witwassen ', { position = "top-center" })




            if IsControlJustReleased(0, 38) and ESX.PlayerData.job.name == Luca.Job then -- E key
                lib.progressCircle({
                    label = 'Witwassen',
                    duration = 6000,
                    position = 'bottom',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                    },
                    anim = {
                        dict = 'amb@prop_human_parking_meter@male@idle_a',
                        clip = 'idle_a'
                    },
                })
                if blackMoney >= 1 then
                    TriggerServerEvent('witwas', blackMoney)
                else
                    lib.notify({
                        title = 'Witwas',
                        description = 'Je hebt geen zwart geld op zak',
                        type = 'error'
                    })
                end
            end
        else
            lib.hideTextUI()
        end

        Wait(sleep)
    end
end)
--------------------------- WITWAS --------------------------------
