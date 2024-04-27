-- This Lua module provides functionalities to manage and utilize ModuleScripts effectively.
-- It acts as a central manager for ModuleScripts, allowing for their initialization,
-- caching, and dynamic invocation of their load functions. The module facilitates efficient
-- handling and reuse of ModuleScripts across a Roblox project by caching instances and
-- preventing duplicate loads. It also supports asynchronous execution of module-specific
-- initialization tasks, enhancing runtime performance and modular architecture coherence.

--
-- Functions:
-- - Get(name): Retrieves a module by its name from the cache.
-- - initialize(modulescripts): Initializes and caches an array of ModuleScripts.
-- - load(): Invokes the 'load' method on all cached modules that define such a method.

local ModuleInitializer = {}
local CachedModules = {}

-- Retrieves a preloaded module from the cache based on its name.
-- @param name (string): The name of the module to retrieve.
-- @return The module if found in the cache, nil otherwise.
function ModuleInitializer.Get(name: string)
	return CachedModules[name]
end

-- Initializes and caches ModuleScripts provided in the input array.
-- @param modulescripts ({ModuleScript}): An array of ModuleScripts to initialize.
function ModuleInitializer.initialize(modulescripts: {ModuleScript})
	for _, moduleScript in pairs(modulescripts) do
		if not moduleScript:IsA("ModuleScript") then continue end
		local module = require(moduleScript)

		if CachedModules[moduleScript.Name] then
			warn("Duplicate module name detected: " .. moduleScript.Name)
			continue
		end
		CachedModules[moduleScript.Name] = module
	end    
end

-- Iterates over all cached modules and calls their 'load' function if it exists.
-- This function uses `task.spawn` to run each 'load' function asynchronously.
function ModuleInitializer.load()
	for _, module in pairs(CachedModules) do
		if module.load then
			task.spawn(module.load)
		end
	end
end

return ModuleInitializer
