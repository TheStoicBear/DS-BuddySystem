-- If this is changed to TRUE all of them will enable at once it is recommended to keep them to false and use which one you want
-- To enable/disable the script in game, type /policebuddy
ScriptEnabled = false

 
-- Keys can be found here: https://docs.fivem.net/docs/game-references/controls/
-- To enable a command to open the menu, put a single command string below, example: "policemenu"
ScriptKey = 84
ScriptCommand = "policemenu"


-- To change the uniform, simply change the ped name below.
ScriptUniform = "s_m_y_cop_01"





-- This is to notify the console that the script is running.
-- Also confirms that the config file has been read.
version = "0.0.1"
print("=====================")
print("Police Buddy Script")
print("Config File Complete")
print("Version: "..version)
print("=====================")
