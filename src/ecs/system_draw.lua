local System = {
	ComponentType = 'view',
}

function System:draw(world)
		for _, entity in pairs(world.entities) do
			local component = entity.components[self.ComponentType]
			if component ~= nil then
				local pos = entity.components['pos']
				if pos ~= nil then
					self.local_update(component.style, pos)
				end
			end
		end
end

function System.local_update(style, pos)
	local xx = pos.x - pos.width / 2
	local yy = pos.y - pos.height / 2
	if style == 1 then
		love.graphics.setColor(200, 0, 0)
	else
		love.graphics.setColor(0, 0, 200)
	end
		love.graphics.rectangle('fill', xx, yy, pos.width, pos.height)
		love.graphics.rectangle('line', xx, yy, pos.width, pos.height)
end

return System
