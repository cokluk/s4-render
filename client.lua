Citizen.CreateThread(function()
    while 1>0 do
        Citizen.Wait(1)	 
        if NetworkIsPlayerActive(PlayerId()) then
           SendNUIMessage({ action = "config", data = Config })
           break
        end
    end
end)

RegisterNUICallback("reqConfig", function(data, cb) 
   SendNUIMessage({ action = "config", data = Config })
end)

RegisterNUICallback("saveVideoData", function(data, cb) 
   TriggerServerEvent(data.data.trigger, data.data)
end)

RegisterNetEvent("s4-render:addNewTask")
AddEventHandler("s4-render:addNewTask", function(trigger, unique, timeout, tip, value)
   SendNUIMessage({ action = "task", data = { trigger = trigger, unique = unique, timeout = timeout, tip = tip or "video", value = value or nil  }  })
end)
 