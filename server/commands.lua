ESX = exports['es_extended']:getSharedObject()

RegisterCommand('mapper', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == 'admin' then
        TriggerClientEvent('es_mapper:toggle', source)
    else
        ESX.ShowNotification('Não tens permissões!', 5000, info)
        -- https://docs.esx-framework.org/legacy/Client/functions/shownotification
    end
end)

