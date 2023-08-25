local Plugin = {}

Plugin.__index = Plugin

function Plugin.new ()
	local self = setmetatable({}, Plugin)
	
	return self
end

function Plugin:CreateUpdateEventListener (UpdateEventName: string, CallbackFunction)
	
	local NewUpdateEvent = game.ReplicatedStorage.DeltaEngineStorage.Events.NewUpdateEvent
	
	--//--//--
	
	NewUpdateEvent.Event:Connect(function(Name: string , Payload: {}) 
		
		if UpdateEventName == Name then
			CallbackFunction(Payload)
		end
		
	end)
end

return Plugin
