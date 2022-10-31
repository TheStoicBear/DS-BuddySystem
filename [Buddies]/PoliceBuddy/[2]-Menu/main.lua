Citizen.CreateThread(function()

    WarMenu.CreateMenu('BuddyMenu:One', 'Police Buddy', 'Press an option below.')
    WarMenu.SetTitleBackgroundColor('BuddyMenu:One', 15, 60, 125, 255)
    WarMenu.SetTitleColor('BuddyMenu:One', 255, 255, 255, 255)

    WarMenu.CreateSubMenu('BuddyMenu:Spawning', 'BuddyMenu:One', 'Police Buddy', 'Spawning Options')
    WarMenu.SetTitleBackgroundColor('BuddyMenu:Spawning', 15, 60, 125, 255)
    WarMenu.SetTitleColor('BuddyMenu:Spawning', 255, 255, 255, 255)

    WarMenu.CreateSubMenu('BuddyMenu:Action', 'BuddyMenu:One', 'Police Buddy', 'Action Options')
    WarMenu.SetTitleBackgroundColor('BuddyMenu:Action', 15, 60, 125, 255)
    WarMenu.SetTitleColor('BuddyMenu:Action', 255, 255, 255, 255)


    while true do 
        Citizen.Wait(0)
        if ScriptEnabled then 
            if WarMenu.IsMenuOpened('BuddyMenu:One') then 
                if WarMenu.Button('Buddy Actions') then 
                    WarMenu.OpenMenu('BuddyMenu:Action')
                elseif WarMenu.Button('Buddy Spawning') then 
                    WarMenu.OpenMenu('BuddyMenu:Spawning')
                elseif WarMenu.Button('Remove Buddies') then 
                    Removal = true 
                end
                WarMenu.Display()
            --Spawning
            elseif WarMenu.IsMenuOpened('BuddyMenu:Spawning') then 
                if WarMenu.Button('Spawn Buddy ('..ScriptUniform..')') then 
                    PoliceBuddy_Spawn(ScriptUniform)
                end
                WarMenu.Display()
            --Actions
            elseif WarMenu.IsMenuOpened('BuddyMenu:Action') then 
                if WarMenu.Button('Have Buddy Get Into Your Vehicle') then 
                    StayCar = true 
                elseif WarMenu.Button('Have Buddy Exit Your Vehicle') then 
                    LeaveCar = true 
                end
            --Open Menu Key
                WarMenu.Display()
            elseif IsControlPressed('0',ScriptKey) and GetLastInputMethod('2') then 
                WarMenu.OpenMenu('BuddyMenu:One')
            end
        end
    end
end)
RegisterCommand(ScriptCommand, function()
WarMenu.OpenMenu('BuddyMenu:One')
end)
RegisterCommand('policebuddy', function()
    ScriptEnabled = not ScriptEnabled
    if ScriptEnabled then 
        ShowNotification('Police Buddy Script ~g~Enabled.')
    else
        ShowNotification('Police Buddy Script ~r~Disabled.')
    end
end)