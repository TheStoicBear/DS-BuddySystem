Citizen.CreateThread(function()

    WarMenu.CreateMenu('CoastBuddyMenu:One', 'Coast Buddy', 'Press an option below.')
    WarMenu.SetTitleBackgroundColor('CoastBuddyMenu:One', 15, 60, 125, 255)
    WarMenu.SetTitleColor('CoastBuddyMenu:One', 255, 255, 255, 255)

    WarMenu.CreateSubMenu('CoastBuddyMenu:Spawning', 'CoastBuddyMenu:One', 'Coast Buddy', 'Spawning Options')
    WarMenu.SetTitleBackgroundColor('CoastBuddyMenu:Spawning', 15, 60, 125, 255)
    WarMenu.SetTitleColor('CoastBuddyMenu:Spawning', 255, 255, 255, 255)

    WarMenu.CreateSubMenu('CoastBuddyMenu:Action', 'CoastBuddyMenu:One', 'Coast Buddy', 'Action Options')
    WarMenu.SetTitleBackgroundColor('CoastBuddyMenu:Action', 15, 60, 125, 255)
    WarMenu.SetTitleColor('CoastBuddyMenu:Action', 255, 255, 255, 255)


    while true do 
        Citizen.Wait(0)
        if ScriptEnabled then 
            if WarMenu.IsMenuOpened('CoastBuddyMenu:One') then 
                if WarMenu.Button('Coast Actions') then 
                    WarMenu.OpenMenu('CoastBuddyMenu:Action')
                elseif WarMenu.Button('Coast Spawning') then 
                    WarMenu.OpenMenu('CoastBuddyMenu:Spawning')
                elseif WarMenu.Button('Remove Buddies') then 
                    Removal = true 
                end
                WarMenu.Display()
            --Spawning
            elseif WarMenu.IsMenuOpened('CoastBuddyMenu:Spawning') then 
                if WarMenu.Button('Spawn Buddy ('..ScriptUniform..')') then 
                    CoastBuddy_Spawn(ScriptUniform)
                end
                WarMenu.Display()
            --Actions
            elseif WarMenu.IsMenuOpened('CoastBuddyMenu:Action') then 
                if WarMenu.Button('Have Buddy Get Into Your Vehicle') then 
                    StayCar = true 
                elseif WarMenu.Button('Have Buddy Exit Your Vehicle') then 
                    LeaveCar = true 
                end
            --Open Menu Key
                WarMenu.Display()
            elseif IsControlPressed('0',ScriptKey) and GetLastInputMethod('2') then 
                WarMenu.OpenMenu('CoastBuddyMenu:One')
            end
        end
    end
end)
RegisterCommand(ScriptCommand, function()
WarMenu.OpenMenu('CoastBuddyMenu:One')
end)
RegisterCommand('Coastbuddy', function()
    ScriptEnabled = not ScriptEnabled
    if ScriptEnabled then 
        ShowNotification('Coast Buddy Script ~g~Enabled.')
    else
        ShowNotification('Coast Buddy Script ~r~Disabled.')
    end
end)