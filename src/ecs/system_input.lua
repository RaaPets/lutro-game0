require('ecs.constants')

local System = {
	ComponentType = 'input',
}

function System:update(world, dt)
		for _, entity in pairs(world.entities) do
			local component = entity.components[self.ComponentType]
			if component ~= nil then
				local pos = entity.components['pos']
				if pos ~= nil then
					self.local_update(component, pos, dt)
				end
			end
		end
end

function System.local_update(joypadId, pos, dt)
	-- system
	if joypadId == 1 then
		if love.joystick.isDown(joypadId, JOYPAD_START) then
			love.event.quit( 'restart' )
		end
	end
	-- PAD
	if love.joystick.isDown(joypadId, JOYPAD_LEFT) then
		pos.width = pos.width - 1 * pad_velo * dt
	end
	if love.joystick.isDown(joypadId, JOYPAD_RIGHT) then
		pos.width = pos.width + 1 * pad_velo * dt
	end
	if love.joystick.isDown(joypadId, JOYPAD_UP) then
		pos.height = pos.height - 1 * pad_velo * dt
	end
	if love.joystick.isDown(joypadId, JOYPAD_DOWN) then
		pos.height = pos.height + 1 * pad_velo * dt
	end
	-- AXIS
	pos.x = pos.x + love.joystick.getAxis(joypadId, AXIS_LEFT_X)
	pos.y = pos.y + love.joystick.getAxis(joypadId, AXIS_LEFT_Y)
	pos.width = pos.width + love.joystick.getAxis(joypadId, AXIS_RIGHT_X)
	pos.height = pos.height + love.joystick.getAxis(joypadId, AXIS_RIGHT_Y)
end

return System
