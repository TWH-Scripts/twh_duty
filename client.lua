local prompts = GetRandomIntInRange(0, 0xffffff)
local openmenu
local actualJob = nil
local showup = false

Citizen.CreateThread(function()
    while true do
        local sleep = true
        Citizen.Wait(5)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)     
        for k, v in pairs(Config.DutyCoords) do
            if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.distance then
                sleep = false
                TriggerServerEvent("twh_duty:getJob")
                if actualJob == nil then
                    Citizen.Wait(100)
                end 
                if actualJob == v.job or actualJob == "off"..v.job then
                    local label = CreateVarString(10, 'LITERAL_STRING',
                                              Config.language.device)
                    PromptSetActiveGroupThisFrame(prompts, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,openmenu) then
                        Citizen.Wait(100)
                         TriggerServerEvent("twh_duty:changeStatus")
                         Citizen.Wait(1000)
                    end
                    
                end

                
            end

        end
        if sleep then
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(5000)
    local str = Config.language.changeStatus
	openmenu = PromptRegisterBegin()
	PromptSetControlAction(openmenu, Config.keys["Prompt"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(openmenu, str)
	PromptSetEnabled(openmenu, 1)
	PromptSetVisible(openmenu, 1)
	PromptSetStandardMode(openmenu,1)
	PromptSetGroup(openmenu, prompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,openmenu,true)
	PromptRegisterEnd(openmenu)
end)


RegisterNetEvent("twh_duty:setJob")
AddEventHandler("twh_duty:setJob", function (job)
    actualJob = job
end)
