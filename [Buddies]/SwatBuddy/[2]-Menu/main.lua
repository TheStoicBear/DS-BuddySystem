Citizen.CreateThread(function()

    WarMenu.CreateMenu('SwatBuddyMenu:One', 'Swat Buddy', 'Press an option below.')
    WarMenu.SetTitleBackgroundColor('SwatBuddyMenu:One', 15, 60, 125, 255)
    WarMenu.SetTitleColor('SwatBuddyMenu:One', 255, 255, 255, 255)

    WarMenu.CreateSubMenu('SwatBuddyMenu:Spawning', 'SwatBuddyMenu:One', 'Swat Buddy', 'Spawning Options')
    WarMenu.SetTitleBackgroundColor('SwatBuddyMenu:Spawning', 15, 60, 125, 255)
    WarMenu.SetTitleColor('SwatBuddyMenu:Spawning', 255, 255, 255, 255)

    WarMenu.CreateSubMenu('SwatBuddyMenu:Action', 'SwatBuddyMenu:One', 'Swat Buddy', 'Action Options')
    WarMenu.SetTitleBackgroundColor('SwatBuddyMenu:Action', 15, 60, 125, 255)
    WarMenu.SetTitleColor('SwatBuddyMenu:Action', 255, 255, 255, 255)


    while true do 
        Citizen.Wait(0)
        if ScriptEnabled then 
            if WarMenu.IsMenuOpened('SwatBuddyMenu:One') then 
                if WarMenu.Button('Swat Actions') then 
                    WarMenu.OpenMenu('SwatBuddyMenu:Action')
                elseif WarMenu.Button('Swat Spawning') then 
                    WarMenu.OpenMenu('SwatBuddyMenu:Spawning')
                elseif WarMenu.Button('Remove Buddies') then 
                    Removal = true 
                end
                WarMenu.Display()
            --Spawning
            elseif WarMenu.IsMenuOpened('SwatBuddyMenu:Spawning') then 
                if WarMenu.Button('Spawn Buddy ('..ScriptUniform..')') then 
                    SwatBuddy_Spawn(ScriptUniform)
                end
                WarMenu.Display()
            --Actions
            elseif WarMenu.IsMenuOpened('SwatBuddyMenu:Action') then 
                if WarMenu.Button('Have Buddy Get Into Your Vehicle') then 
                    StayCar = true 
                elseif WarMenu.Button('Have Buddy Exit Your Vehicle') then 
                    LeaveCar = true 
                end
            --Open Menu Key
                WarMenu.Display()
            elseif IsControlPressed('0',ScriptKey) and GetLastInputMethod('2') then 
                WarMenu.OpenMenu('SwatBuddyMenu:One')
            end
        end
    end
end)
RegisterCommand(ScriptCommand, function()
WarMenu.OpenMenu('SwatBuddyMenu:One')
end)
RegisterCommand('swatbuddy', function()
    ScriptEnabled = not ScriptEnabled
    if ScriptEnabled then 
        ShowNotification('Swat Buddy Script ~g~Enabled.')
    else
        ShowNotification('Swat Buddy Script ~r~Disabled.')
    end
end)