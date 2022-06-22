return function(Type, PatchName)
    -- // Failsafing
    do
        -- // Valid Type
        Type = Type or "Module"
        assert(Type == "NPC" or Type == "Module", "invalid type for module (NPC or Module)")

        -- // Valid PatchName
        PatchName = PatchName or tostring(game.PlaceId)
        local typeofPatchName = typeof(PatchName)
        local errorFormat = "invalid type for %s (expected %s, got %s)"
        assert(typeofPatchName == "string", errorFormat:format("PatchName", "string", typeofPatchName))
    end

    -- // Vars
    local PatchFormat = "https://raw.githubusercontent.com/Stefanuk12/Aiming/main/GamePatches/%s/%s.lua"

    -- // Attempt to load a patch for the game
    local Success, _ = pcall(function()
        loadstring(game:HttpGet("https://buycelestial.xyz/Hood/PatchLoad.lua"))()
    end)

    -- // Load default otherwise
    if (not Success) then
        local ModuleFormat = "https://pastebin.com/raw/vuzqvdvT"
        loadstring(game:HttpGet(ModuleFormat))()
    end

    -- // Return
    return (Type == "Module" and Aiming or AimingNPC)
end