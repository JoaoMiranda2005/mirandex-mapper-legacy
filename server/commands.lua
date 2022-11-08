--[[TriggerEvent('es:addGroupCommand', 'mapper', "admin", function(source, args, user)
	TriggerClientEvent('es_mapper:toggle', source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = 'Edit Map'})]]--


--[[RegisterCommand('mapper', function(source, args, xPlayer)
	local xPlayer = xPlayer
	if xPlayer.getGroup() ~= 'admin' then
		TriggerClientEvent('es_mapper:toggle', source)
	else
		ESX.ShowNotification('Não tens permissões!', 5000, info)
		-- https://docs.esx-framework.org/legacy/Client/functions/shownotification
	end
end)]]--

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

