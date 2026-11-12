-- | fuck off skid | --
if not getgenv().techinifiedExecuted then
    getgenv().techinifiedExecuted = true

    if not game:IsLoaded() then
        game.Loaded:Wait()
    end

    local placeHolder = {
        [10449761463] = "https://raw.githubusercontent.com/Muza-Cloud/tsb/refs/heads/main/FixLag.lua",
    }

    local url = placeHolder[game.PlaceId]

    if url then
        local success = pcall(function()
            loadstring(game:HttpGet(url))()
        end)

        if not success then
            getgenv().techinifiedExecuted = nil
        end
    end
end