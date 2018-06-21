
--replayChannel set to 100
--Channel set to 3
function sendMessage()
	if peripheral.isPresent("right") then
		if 	peripheral.getType("right") == "modem" then
			local modem = peripheral.wrap("right")
			modem.transmit(3, 100, "Hello world!")
		end
	end
end