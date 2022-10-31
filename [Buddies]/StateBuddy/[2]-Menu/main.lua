Citizen.CreateThread(function()

    WarMenu.CreateMenu('StateBuddy:One', 'State Buddy', 'Press an option below.')
    WarMenu.SetTitleBackgroundColor('StateBuddy:One', 15, 60, 125, 255)
    WarMenu.SetTitleColor('StateBuddy:One', 255, 255, 255, 255)

    WarMenu.CreateSubMenu('StateBuddy:Spawning', 'StateBuddy:One', 'State Buddy', 'Spawning Options')
    WarMenu.SetTitleBackgroundColor('StateBuddy:Spawning', 15, 60, 125, 255)
    WarMenu.SetTitleColor('StateBuddy:Spawning', 255, 255, 255, 255)

    WarMenu.CreateSubMenu('StateBuddy:Action', 'StateBuddy:One', 'State Buddy', 'Action Options')
    WarMenu.SetTitleBackgroundColor('StateBuddy:Action', 15, 60, 125, 255)
    WarMenu.SetTitleColor('StateBuddy:Action', 255, 255, 255, 255)


    while true do 
        Citizen.Wait(0)
        if ScriptEnabled then 
            if WarMenu.IsMenuOpened('StateBuddy:One') then 
                if WarMenu.Button('State Actions') then 
                    WarMenu.OpenMenu('StateBuddy:Action')
                elseif WarMenu.Button('State Spawning') then 
                    WarMenu.OpenMenu('StateBuddy:Spawning')
                elseif WarMenu.Button('Remove Buddies') then 
                    Removal = true 
                end
                WarMenu.Display()
            --Spawning
            elseif WarMenu.IsMenuOpened('StateBuddy:Spawning') then 
                if WarMenu.Button('Spawn Buddy ('..ScriptUniform..')') then 
                    StateBuddy_Spawn(ScriptUniform)
                end
                WarMenu.Display()
            --Actions
            elseif WarMenu.IsMenuOpened('StateBuddy:Action') then 
                if WarMenu.Button('Have Buddy Get Into Your Vehicle') then 
                    StayCar = true 
                elseif WarMenu.Button('Have Buddy Exit Your Vehicle') then 
                    LeaveCar = true 
                end
            --Open Menu Key
                WarMenu.Display()
            elseif IsControlPressed('0',ScriptKey) and GetLastInputMethod('2') then 
                WarMenu.OpenMenu('StateBuddy:One')
            end
        end
    end
end)
RegisterCommand(ScriptCommand, function()
WarMenu.OpenMenu('StateBuddy:One')
end)
RegisterCommand('statebuddy', function()
    ScriptEnabled = not ScriptEnabled
    if ScriptEnabled then 
        ShowNotification('State Buddy Script ~g~Enabled.')
    else
        ShowNotification('State Buddy Script ~r~Disabled.')
    end
end)