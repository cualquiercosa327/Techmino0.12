local function socketConnect()
    wsConnect(
		TICK.wsCONN_connect,
		"/solo?room_id=114",
		{}
	)
end
local function socketWrite()
	if not WSCONN then
		LOG.print("尚未连接到服务器","warn")
		return
	end
	local message = WIDGET.active.message.value
	print("TextBox: "..message)
	local writeErr = client.write(WSCONN, message)
	if writeErr then
		print(writeErr, "warn")
	end
	return true
end

WIDGET.init("netgame",{
	WIDGET.newText{name="title",		x=80,	y=50,font=70,align="L"},
	WIDGET.newTextBox{name="message",	x=380,	y=200,w=500,h=60},
	WIDGET.newButton{name="test",		x=1140,	y=100,w=170,h=80,color="green",code=socketConnect},
	WIDGET.newButton{name="test",		x=380,	y=640,w=170,h=80,color="cyan",code=socketWrite},
	WIDGET.newButton{name="back",		x=1140,	y=640,w=170,h=80,font=40,code=WIDGET.lnk_BACK},
})