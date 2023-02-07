ESX = exports['es_extended']:getSharedObject()

RegisterCommand('mapper', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local steamid = GetPlayerIdentifiers(source)[1]
    if xPlayer.getGroup() == 'admin' then
        TriggerClientEvent('es_mapper:toggle', source)
            logs('✩✩✩ Comando Admin ✩✩✩\n[Comando]: /mapper \n[Staff]: '..steamid..'', 'YOUR_WEBHOOK_HERE', '#00FF00')
    else
        ESX.ShowNotification('Não tens permissões!', 5000, info)
        -- https://docs.esx-framework.org/legacy/Client/functions/shownotification
    end
end)

function logs (message,webhook)
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = 'Mirandex Mapper Logs', embeds = {{["color"] = corfinal, ["author"] = {["name"] = 'Mirandex Mapper Logs', ["icon_url"] = ''}, ["description"] = message, ["footer"] = {["text"] = "Mirandex Mapper Logs - "..os.date("%x %X %p"),["icon_url"] = "",},}}, avatar_url = ''}), { ['Content-Type'] = 'application/json' })
end
