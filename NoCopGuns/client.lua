-- Declare variables
local pedModels = {} -- table to store the ped models
local weaponHash = GetHashKey("WEAPON_PISTOL") -- hash of the weapon to remove

-- Create a function to remove weapons from AI cops
function removeAIWeapons()
  -- Get a list of all the ped models currently spawned on the server
  pedModels = ESX.Game.GetPeds()

  -- Loop through the list of ped models
  for i = 1, #pedModels do
    -- Check if the ped model is an AI cop
    if IsPedModel(pedModels[i], "s_f_y_cop_01") or IsPedModel(pedModels[i], "s_m_y_cop_01") then
      -- Remove the weapon from the AI cop
      RemoveAllPedWeapons(pedModels[i], true)
    end
  end
end

-- Run the removeAIWeapons function every minute
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(60000) -- wait for one minute
    removeAIWeapons()
  end
end)