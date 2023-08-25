
--[[
	________     __________       __________              _____             
	___  __ \_______  /_  /______ ___  ____/_____________ ___(_)___________ 
	__  / / /  _ \_  /_  __/  __ `/_  __/  __  __ \_  __ `/_  /__  __ \  _ \
	_  /_/ //  __/  / / /_ / /_/ /_  /___  _  / / /  /_/ /_  / _  / / /  __/
	/_____/ \___//_/  \__/ \__,_/ /_____/  /_/ /_/_\__, / /_/  /_/ /_/\___/ 
	                                              /____/                    
		                                              
	Thanks for using DeltaEngine!
    
    Publisher: Nyvex-Core Studios
    Owner: Nyvex-Core Studios
    Programmer: preakrust
    GitHub Reposatory: https://github.com/Preakrust/DeltaEngine
    
    --|| 🎩 Nyvex-Core Studios Seal Of Quality 🎩 ||--
]]

--// Services //--

local PlayerService = game.Players

--// Storage //--

local DeltaEngineServer = game.ServerScriptService.DeltaEngineServer
local DeltaEngineStorage = game.ReplicatedStorage.DeltaEngineStorage

--// EngineSettings //--

local EngineSettings = require(DeltaEngineServer.EngineSettings)

--// Libraries //--

local Libraries = DeltaEngineServer.Libraries

--// Events //--

local Events = DeltaEngineStorage.Events

--// Functions //--

local NewUpdateEvent = function (Name: string, Payload: {})
	local NewUpdateEvent = game.ReplicatedStorage.DeltaEngineStorage.Events.NewUpdateEvent
	
	--// Fire it //--
	
	NewUpdateEvent:Fire(Name, Payload)
end

local Console = {
	Log = function (message: string)
		if EngineSettings.ConsoleOutput then
			warn(message)
		end
	end,
}

--// Console //--

Console.Log("Delta Engine just loaded!")

--// Notify Plugins //--

NewUpdateEvent("OnEngineReady", {})

--// Player part //--

PlayerService.PlayerAdded:Connect(function(player: Player)
	
	--// Notify Plugins //--

	NewUpdateEvent("OnPlayerAdded", {["Player"] = player})
	
	--// Wait for char to load //--
	
	player.CharacterAppearanceLoaded:Connect(function(character: Model) 
		--// Notify Plugins //--

		NewUpdateEvent("OnCharacterLoaded", {["Player"] = player})
	end)
end)
