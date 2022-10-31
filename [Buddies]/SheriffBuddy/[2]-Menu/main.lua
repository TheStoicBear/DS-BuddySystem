Citizen.CreateThread(function()

    WarMenu.CreateMenu('SheriffBuddyMenu:One', 'Sheriff Buddy', 'Press an option below.')
    WarMenu.SetTitleBackgroundColor('SheriffBuddyMenu:One', 15, 60, 125, 255)
    WarMenu.SetTitleColor('SheriffBuddyMenu:One', 255, 255, 255, 255)

    WarMenu.CreateSubMenu('SheriffBuddyMenu:Spawning', 'SheriffBuddyMenu:One', 'Sheriff Buddy', 'Spawning Options')
    WarMenu.SetTitleBackgroundColor('SheriffBuddyMenu:Spawning', 15, 60, 125, 255)
    WarMenu.SetTitleColor('SheriffBuddyMenu:Spawning', 255, 255, 255, 255)

    WarMenu.CreateSubMenu('SheriffBuddyMenu:Action', 'SheriffBuddyMenu:One', 'Sheriff Buddy', 'Action Options')
    WarMenu.SetTitleBackgroundColor('SheriffBuddyMenu:Action', 15, 60, 125, 255)
    WarMenu.SetTitleColor('SheriffBuddyMenu:Action', 255, 255, 255, 255)


    while true do 
        Citizen.Wait(0)
        if ScriptEnabled then 
            if WarMenu.IsMenuOpened('SheriffBuddyMenu:One') then 
                if WarMenu.Button('Sheriff Actions') then 
                    WarMenu.OpenMenu('SheriffBuddyMenu:Action')
                elseif WarMenu.Button('Sheriff Spawning') then 
                    WarMenu.OpenMenu('SheriffBuddyMenu:Spawning')
                elseif WarMenu.Button('Remove Buddies') then 
                    Removal = true 
                end
                WarMenu.Display()
            --Spawning
            elseif WarMenu.IsMenuOpened('SheriffBuddyMenu:Spawning') then 
                if WarMenu.Button('Spawn Buddy ('..ScriptUniform..')') then 
                    SheriffBuddy_Spawn(ScriptUniform)
                end
                WarMenu.Display()
            --Actions
            elseif WarMenu.IsMenuOpened('SheriffBuddyMenu:Action') then 
                if WarMenu.Button('Have Buddy Get Into Your Vehicle') then 
                    StayCar = true 
                elseif WarMenu.Button('Have Buddy Exit Your Vehicle') then 
                    LeaveCar = true 
                end
            --Open Menu Key
                WarMenu.Display()
            elseif IsControlPressed('0',ScriptKey) and GetLastInputMethod('2') then 
                WarMenu.OpenMenu('SheriffBuddyMenu:One')
            end
        end
    end
end)
RegisterCommand(ScriptCommand, function()
WarMenu.OpenMenu('SheriffBuddyMenu:One')
end)
RegisterCommand('sheriffbuddy', function()
    ScriptEnabled = not ScriptEnabled
    if ScriptEnabled then 
        ShowNotification('Sheriff Buddy Script ~g~Enabled.')
    else
        ShowNotification('Sheriff Buddy Script ~r~Disabled.')
    end
end)