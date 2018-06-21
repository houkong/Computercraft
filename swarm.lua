os.loadAPI("data.lua")
os.loadAPI("Turtle.lua")


Turtle.goForward()
Turtle.turnLeft()
Turtle.goForward(3)
	

pos = data.getPosition()
dir = data.getDirection()
print(pos)
print(dir)

