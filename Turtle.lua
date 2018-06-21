os.loadAPI("data.lua")

--Rotation matrices
left = {0,-1,1,0}
right = {0,1,-1,0}
--Position unit vectors
unitX = vector.new(1,0,0)
unitY = vector.new(0,1,0)
unitZ = vector.new(0,0,1)
whitelistedArea = {-1,1,-1,1,-1,1}


function turnLeft()
	if hasFuel() then
		turtle.turnLeft()
		local direction = data.getDirection()
		data.saveDirection(data.matrixMultiplication(left, direction))
	else
		print("Error turnLeft(): Out of fuel")
	end
end
function turnRight()
	if hasFuel() then
		turtle.turnRight()
		local direction = data.getDirection()
		data.saveDirection(data.matrixMultiplication(right, direction))
	else
		print("Error turnLeft(): Out of fuel")
	end
end

function goForward(...)
	local args = { ... }
	local count = 1
	if #args > 0 then
		if type(args[1]) ~= type(1) then print("Error goForward(): expected number") end
		count = args[1]
	end
	for i = 1, count do
		if hasFuel() then
			if not isInsideHouse() then
				while turtle.detect() do
					turtle.dig()
				end
			else
				print("Error goForward(): digging not allowed")
			end
		end
		if not turtle.forward() then
			print("Error goForward(): unable to move forward")
		end
		local position = data.getPosition()
		local direction = data.getDirection()
		local newPosition = position:add(direction)
		data.savePosition(newPosition)
	end
end
function goUp(...)
local args = { ... }
	local count = 1
	if #args > 0 then
		if type(args[1]) ~= type(1) then print("Error goUp(): expected number") end
		count = args[1]
	end
	for i = 1, count do
		if hasFuel() then
			if not isInsideHouse() then
				while turtle.detectUp() do
					turtle.digUp()
				end
			else
				print("Error goUp(): digging not allowed")
			end
		end
		if not turtle.up() then
			print("Error goUp(): uanble to move up")
		end
		local position = data.getPosition()
		local newPosition = position + unitZ
		data.savePosition(newPosition)
	end
end
function goDown(...)
	local args = { ... }
	local count = 1
	if #args > 0 then
		if type(args[1]) ~= type(1) then print("Error goDown(): expected number") end
		count = args[1]
	end
	for i = 1, count do 
		if hasFuel() then
			if not isInsideHouse() then
				while turtle.detectDown() do
					turtle.digDown()
				end
			else
				print("Error goDown(): digging not allowed")
			end
		end
		if not turtle.down() then
			print("Error goDown(): unable to move down")
		end
		local position = data.getPosition()
		local newPosition = position - unitZ
		data.savePosition(newPosition)
	end
end

function hasFuel()
	local var = true
	while turtle.getFuelLevel() < 100 do
		if turtle.refuel(1) then
			var = true
		else
			var = false
		end
	end
	if not var then
		print("Error hasFuel(): Out of fuel")
	end
	return true
end

function isInsideHouse()
	return false
end
