-- Simple Lua Module Example
--
-- Overview:
-- This module, named `Module`, showcases a basic example of Lua module construction and function encapsulation.
-- It is designed to demonstrate how functions can be organized within a module to maintain clean code separation
-- and promote reusable code practices. The module includes a simple function, `test`, that prints a message to the console,
-- illustrating basic function calling within a modular structure. The `load` function serves as the public interface
-- of the module, providing access to internal functionalities.
--
-- Usage:
-- The module is especially useful for educational purposes, helping new developers understand the principles
-- of modular programming in Lua. It can be used in Lua-based environments like Roblox, where modular code organization
-- is crucial for scalable game development.
--
-- Functions:
-- - `test()`: A private function that outputs a test message to the console.
-- - `load()`: The public function that exposes the `test` functionality to module consumers.

local Module = {}

-- A private function within the module that prints "test".
local function test()
    print("test")
end

-- Public function that calls the private `test` function.
-- This function demonstrates how to expose specific functionalities of a module,
-- allowing external access while keeping other parts private.
function Module.load()
    test()
end

return Module
