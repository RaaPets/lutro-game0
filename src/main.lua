
local world = require('ecs.world')
local inputSystem = require('ecs.system_input')
local drawSystem = require('ecs.system_draw')

-- local Player = require('Player')

-- local player_1 = Player:new( 1, 5, 5)
-- local player_2 = Player:new( 2, 50, 50)

-- LUTRO callback
function love.load()
	print('DBG:', 'load')
	print('DBG:', 'Vestion', love.getVersion())

	screen_width  = love.graphics.getWidth()
	screen_height = love.graphics.getHeight()
	print('DBG: size', screen_width, screen_height)

	playerId_1 = world:createEntity()
		world:addComponent(playerId_1, 'input', 1)
		world:addComponent(playerId_1, 'pos', {x=5, y=5, width=10, height=15})
		world:addComponent(playerId_1, 'view', {style = 1})

	playerId_2 = world:createEntity()
		world:addComponent(playerId_2, 'input', 2)
		world:addComponent(playerId_2, 'pos', {x=50, y=50, width=15, height=10})
		world:addComponent(playerId_2, 'view', {style = 2})
end

-- LUTRO callback
function love.update(dt)
	inputSystem:update(world, dt)

	-- player_1:update(dt)
	-- player_2:update(dt)
end

-- LUTRO callback
function love.draw()
	drawSystem:draw(world)
	-- player_1:draw()
	-- player_2:draw()
end
