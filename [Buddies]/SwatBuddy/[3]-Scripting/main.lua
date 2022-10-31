function SwatBuddy_Spawn(Uniform)
    PlayerPosition = GetEntityCoords(GetPlayerPed(-1))
    local BuddyModel = Uniform
    local BuddyModelHash = GetHashKey(BuddyModel)
    RequestModel(BuddyModelHash)
    while not HasModelLoaded(BuddyModelHash) do
        Wait(1)
    end
    local Buddy = CreatePed(6, BuddyModelHash, PlayerPosition, true, true)
    if DoesEntityExist(Buddy) then 
        TriggerEvent('SwatBuddy:SetBuddy',Buddy)
        GiveWeaponToPed(Buddy,0x2BE6766B,1000,false,false)
        SetPedCombatAbility(Buddy,100)
        SetPedCombatAttributes(Buddy,46,true)
    else
        ShowNotification('Failed to create ped.')
    end
end

RegisterNetEvent('SwatBuddy:SetBuddy')
AddEventHandler('SwatBuddy:SetBuddy', function(Bud)
local player = GetPlayerPed(-1)
local playerPos = GetEntityCoords( player )
local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( player, 0.0, 2.0, 0.0 )
Bud = Bud
  if DoesEntityExist(Bud) then
    NetworkRequestControlOfEntity(Bud)
    ClearPedTasksImmediately(Bud)
    SetEntityAsMissionEntity(Bud)
    SetBlockingOfNonTemporaryEvents(Bud, false)

    playerGroupId = GetPedGroupIndex(player)
    SetPedAsGroupMember(Bud, playerGroupId)
    SetGroupFormationSpacing(playerGroupId,1.0,1.0,1.0)
    SetPedArmour(Bud, math.random(50, 100))

    AddRelationshipGroup("BUM1")
    SetPedCombatAttributes(Bud, 5, true)
    SetPedCombatAbility(Bud, 100)
    SetRelationshipBetweenGroups(0, GetHashKey("BUM1"), GetHashKey("PLAYER"))
    SetPedRelationshipGroupHash(Bud, GetHashKey("BUM1"))
    ShowNotification('~b~Buddy Created.')
    BuddyBlip = AddBlipForEntity(Bud)
    SetBlipColour(BuddyBlip, 3)
    SetBlipSprite(BuddyBlip, 480)
    TriggerEvent('RegisterBuddy', Bud)
  else
    ShowNotification('Error. Please contact development.')
  end
end)
--=============================================
RegisterNetEvent('RegisterBuddy')
AddEventHandler('RegisterBuddy', function(Bud)
SetEntityAsMissionEntity(Bud)
local Bud = Bud
local Buddy = Bud 
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        if DoesEntityExist(Buddy) then
            if StayCar then 
                TriggerEvent('staycar', Buddy) 
                StayCar = false 
            end
            if LeaveCar then 
                TriggerEvent('leavecar', Buddy) 
                LeaveCar = false 
            end
            if Removal then 
                DeleteEntity(Buddy)
                BuddyBlip = RemoveBlip(BuddyBlip)
                ShowNotification('~r~Buddy Removed.')
                Wait(500)
                Removal = false 
            end
            if IsPedDeadOrDying(GetPlayerPed(-1), 1) then 
                DeleteEntity(Buddy)
                BuddyBlip = RemoveBlip(BuddyBlip)
                ShowNotification('~r~Buddy Removed.')
            end
            if GetSeatPedIsTryingToEnter(Buddy) ~= 0 then
                TaskEnterVehicle(Buddy, GetVehiclePedIsIn(GetPlayerPed(-1)), -1, 0, 1.0, 1, 0)
            end
        end
    end
    end)
end)
--=============================================
RegisterNetEvent('staycar')
AddEventHandler('staycar', function(Bud)
local targetVehh = GetPlayersLastVehicle(player)
local player = GetPlayerPed(-1)
local playerGroupId = GetPedGroupIndex(player)

if DoesEntityExist(Bud) then
	if IsPedInVehicle(Bud, targetVehh, false) then
		ShowNotification('Buddy Staying In Car.')
		RemovePedFromGroup(Bud)
		SetBlockingOfNonTemporaryEvents(Bud, true)
		--ClearPedTasksImmediately(Bud)
	else
		ShowNotification('Buddy Going To Car.')
		RemovePedFromGroup(Bud)
		SetBlockingOfNonTemporaryEvents(Bud, true)
		ClearPedTasksImmediately(Bud)
		TaskEnterVehicle(Bud, targetVehh, -1, 0, 1.0, 1, 0)
	end
else
	ShowNotification('Buddy Does Not Exist.')
end
end)
RegisterNetEvent('leavecar')
AddEventHandler('leavecar', function(Bud)
local targetVehh = GetPlayersLastVehicle(player)
local player = GetPlayerPed(-1)
local playerGroupId = GetPedGroupIndex(player)

if DoesEntityExist(Bud) then
	if IsPedInVehicle(Bud, targetVehh, false) then
		ShowNotification('Buddy Getting Out Of Car.')
		NetworkRequestControlOfEntity(Bud)
		ClearPedTasksImmediately(Bud)
		TriggerEvent('selped', NetworkGetNetworkIdFromEntity(Bud))
		SetEntityAsMissionEntity(Bud)
		SetBlockingOfNonTemporaryEvents(Bud, true)
		SetPedAsGroupMember(Bud, playerGroupId)
		SetGroupFormationSpacing(playerGroupId,1.0,1.0,1.0)
		SetPedArmour(Bud, math.random(50, 100))
		AddRelationshipGroup("BUM1")
		SetPedCombatAttributes(Bud, 5, true)
		SetPedCombatAbility(Bud, 100)
		SetRelationshipBetweenGroups(0, GetHashKey("BUM1"), GetHashKey("PLAYER"))
		SetPedRelationshipGroupHash(Bud, GetHashKey("BUM1"))
	else
		ShowNotification('Buddy Is Not In A Vehicle.')
	end
else
	ShowNotification('Buddy Does Not Exist.')
end
end)