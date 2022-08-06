local VorpCore = {}
TriggerEvent("getCore",function(core)
	VorpCore = core
end)
Citizen.CreateThread(function ()
	if Config.commandTrigger then
		RegisterCommand(Config.command, function(source, args, rawCommand)
			TriggerEvent('twh_duty:changeStatus')
		end)
		
	end
	
end)


RegisterServerEvent("twh_duty:getJob")
AddEventHandler( "twh_duty:getJob", function()
	local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
	TriggerClientEvent("twh_duty:setJob",_source, job)
end)



RegisterServerEvent('twh_duty:changeStatus')
AddEventHandler( 'twh_duty:changeStatus', function()
	local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
	local hadJob = false
	for k, v in pairs(Config.jobs) do
		if job == v or job == "off"..v then
			TriggerEvent('twh_duty:jobs', _source)
			hadJob = true
		end
		
	end
	if not hadJob then
		TriggerClientEvent("vorp:TipRight", _source, Config.language.noJob, 2000)
	end
end)

RegisterServerEvent('twh_duty:jobs')
AddEventHandler( 'twh_duty:jobs', function(source)

		local _source = source
		local Character = VorpCore.getUser(_source).getUsedCharacter
		local job = Character.job
		for k, v in pairs(Config.jobs) do
			if job == v then
				Character.setJob('off'..v)
				TriggerClientEvent("vorp:NotifyLeft",_source, Config.language.duty,Config.language.offduty, "generic_textures", "star_outline", 3000)


			elseif job == "off"..v then
				Character.setJob(v)				
				TriggerClientEvent("vorp:NotifyLeft",_source, Config.language.duty,Config.language.induty, "generic_textures", "star", 3000)
			end
			
		end
end)



		