local globalDriftState = false

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

RegisterCommand("toggledrift", function()
    local playerPed = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerPed, false)
    if playerVehicle ~= 0 and IsVehicleOnAllWheels(playerVehicle) and GetPedInVehicleSeat(playerVehicle, -1) == playerPed then
        globalDriftState = not GetDriftTyresEnabled(playerVehicle)
        SetDriftTyresEnabled(playerVehicle, globalDriftState)
        SetReduceDriftVehicleSuspension(playerVehicle, globalDriftState)
        if globalDriftState then
            ShowNotification("~b~Drift is ~g~ON")
        else
            ShowNotification("~b~Drift is ~r~OFF")
        end
    end
end)
RegisterKeyMapping("toggledrift", "Toggle Drift", "keyboard", "lshift")
