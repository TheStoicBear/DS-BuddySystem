Citizen.CreateThread(function()

    WarMenu.CreateMenu('FBIBuddyMenu:One', 'FBI Buddy', 'Press an option below.')
    WarMenu.SetTitleBackgroundColor('FBIBuddyMenu:One', 15, 60, 125, 255)
    WarMenu.SetTitleColor('FBIBuddyMenu:One', 255, 255, 255, 255)

    WarMenu.CreateSubMenu('FBIBuddyMenu:Spawning', 'FBIBuddyMenu:One', 'FBI Buddy', 'Spawning Options')
    WarMenu.SetTitleBackgroundColor('FBIBuddyMenu:Spawning', 15, 60, 125, 255)
    WarMenu.SetTitleColor('FBIBuddyMenu:Spawning', 255, 255, 255, 255)

    WarMenu.CreateSubMenu('FBIBuddyMenu:Action', 'FBIBuddyMenu:One', 'FBI Buddy', 'Action Options')
    WarMenu.SetTitleBackgroundColor('FBIBuddyMenu:Action', 15, 60, 125, 255)
    WarMenu.SetTitleColor('FBIBuddyMenu:Action', 255, 255, 255, 255)


    while true do 
        Citizen.Wait(0)
        if ScriptEnabled then 
            if WarMenu.IsMenuOpened('FBIBuddyMenu:One') then 
                if WarMenu.Button('FBI Actions') then 
                    WarMenu.OpenMenu('FBIBuddyMenu:Action')
                elseif WarMenu.Button('FBI Spawning') then 
                    WarMenu.OpenMenu('FBIBuddyMenu:Spawning')
                elseif WarMenu.Button('Remove Buddies') then 
                    Removal = true 
                end
                WarMenu.Display()
            --Spawning
            elseif WarMenu.IsMenuOpened('FBIBuddyMenu:Spawning') then 
                if WarMenu.Button('Spawn Buddy ('..ScriptUniform..')') then 
                    FBIBuddy_Spawn(ScriptUniform)
                end
                WarMenu.Display()
            --Actions
            elseif WarMenu.IsMenuOpened('FBIBuddyMenu:Action') then 
                if WarMenu.Button('Have Buddy Get Into Your Vehicle') then 
                    StayCar = true 
                elseif WarMenu.Button('Have Buddy Exit Your Vehicle') then 
                    LeaveCar = true 
                end
            --Open Menu Key
                WarMenu.Display()
            elseif IsControlPressed('0',ScriptKey) and GetLastInputMethod('2') then 
                WarMenu.OpenMenu('FBIBuddyMenu:One')
            end
        end
    end
end)
RegisterCommand(ScriptCommand, function()
WarMenu.OpenMenu('FBIBuddyMenu:One')
end)
RegisterCommand('FBIbuddy', function()
    ScriptEnabled = not ScriptEnabled
    if ScriptEnabled then 
        ShowNotification('FBI Buddy Script ~g~Enabled.')
    else
        ShowNotification('FBI Buddy Script ~r~Disabled.')
    end
end)