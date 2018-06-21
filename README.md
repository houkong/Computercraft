# Computercraft
# For using the API, write the following in the first two lines

# os.loadAPI("data.lua")
# os.loadAPI("Turtle.lua")

# --data API
#data.split(str, pat) --Constructs a table whose indices are given by the string blocks seperated by the pat delimittter
#data.savePosition(position) --Saves position to file. Note: position must be a vector
#data.getPosition() --returns position vector from file
#data.saveDirection(direction) --Saves direction to file. Note: direction must be a vector
#data.getDirection --returns direction vector from file

#-All Turtle.function() includes automatic refueling if needed
#-All Turtle.moveFunction() includes saving position and dirction to file
#-The paramter count is optional. If included, it determines how many times the function iterates
#Turtle.turnLeft() 
#Turtle.turnRight() 
#Turtle.goForward(count) --digs block(s) if needed
#Turtle.goUp(count) --digs block(s) if needed
#Turtle.goDown(count) --digs block(s) if needed

