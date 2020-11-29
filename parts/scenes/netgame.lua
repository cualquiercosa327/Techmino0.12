local function socket_test()
    
end

WIDGET.init("netgame",{
	WIDGET.newText{name="title",		x=80,	y=50,font=70,align="L"},
	WIDGET.newButton{name="test",		x=1140,	y=100,w=170,h=80,color="green",code=socket_test()},
	WIDGET.newButton{name="back",		x=1140,	y=640,w=170,h=80,font=40,code=WIDGET.lnk_BACK},
})