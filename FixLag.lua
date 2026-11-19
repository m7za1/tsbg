--[[

This File Was Protected By ???
Owner: Techinified

]]--

--[[

███████╗██╗░░░██╗░█████╗░██╗░░██╗
██╔════╝██║░░░██║██╔══██╗██║░██╔╝
█████╗░░██║░░░██║██║░░╚═╝█████═╝░
██╔══╝░░██║░░░██║██║░░██╗██╔═██╗░
██║░░░░░╚██████╔╝╚█████╔╝██║░╚██╗
╚═╝░░░░░░╚═════╝░░╚════╝░╚═╝░░╚═╝

░█████╗░███████╗███████╗
██╔══██╗██╔════╝██╔════╝
██║░░██║█████╗░░█████╗░░
██║░░██║██╔══╝░░██╔══╝░░
╚█████╔╝██║░░░░░██║░░░░░
░╚════╝░╚═╝░░░░░╚═╝░░░░░

░██████╗██╗░░██╗██╗██████╗░
██╔════╝██║░██╔╝██║██╔══██╗
╚█████╗░█████═╝░██║██║░░██║
░╚═══██╗██╔═██╗░██║██║░░██║
██████╔╝██║░╚██╗██║██████╔╝
╚═════╝░╚═╝░░╚═╝╚═╝╚═════╝░

]]--



if not getgenv().techinifiedExecuted then
    getgenv().techinifiedExecuted = true

    if not game:IsLoaded() then
        game.Loaded:Wait()
    end

    local placeHolder = {
        [10449761463] = "https://flowauth.net/v1/loaders/d804fec96214bc1d31dd835e8133a3b2.lua"
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