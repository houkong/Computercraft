function matrixMultiplication(matrix, old_vector)
	a = vector.new(matrix[1], matrix[2])
	b = vector.new(matrix[3], matrix[4])
	new_vector = vector.new(a:dot(old_vector), b:dot(old_vector))
	return new_vector   
end

function savePosition(position)
	local h = fs.open("position", "w")
	local str = tostring(position.x).."/"..tostring(position.y).."/"..tostring(position.z)
	h.write(str)
	h.close()
end
function getPosition()
	local h = fs.open("position", "r")
	local positionStr = h.readAll()
	h.close()
	positionTable = split(positionStr, "/")
	local position = vector.new(positionTable[1], positionTable[2], positionTable[3])
	return position
end	

function saveDirection(direction)
	local h = fs.open("direction", "w")
	local str = tostring(direction.x).."/"..tostring(direction.y).."/"..tostring(direction.z)
	h.write(str)
	h.close()
end
function getDirection()
	local h = fs.open("direction", "r")
	local directionStr = h.readAll()
	h.close()
	directionTable = split(directionStr, "/")
	local direction = vector.new(directionTable[1], directionTable[2], directionTable[3])
	return direction
end

function split(str, pat)
   local t = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pat
   local last_end = 1
   local s, e, cap = str:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
         table.insert(t,cap)
      end
      last_end = e+1
      s, e, cap = str:find(fpat, last_end)
   end
   if last_end <= #str then
      cap = str:sub(last_end)
      table.insert(t, cap)
   end
   return t
end