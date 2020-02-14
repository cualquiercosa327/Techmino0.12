local gc=love.graphics
local rnd=math.random
return{
	name={
		"竞速",
		"竞速",
		"Sprint",
	},
	level={
		"1000L",
		"1000行",
		"1000L",
	},
	info={
		"消除1000行",
		"消除1000行",
		"Clear 1000 lines",
	},
	color=color.lightGrey,
	env={
		drop=60,lock=60,
		target=1000,dropPiece=Event.reach_winCheck,
		bg="strap",bgm="push",
	},
	load=function()
		newPlayer(1,340,15)
	end,
	mesDisp=function(P)
		local dx,dy=P.fieldOff.x,P.fieldOff.y
		setFont(55)
		local r=1000-P.stat.row
		if r<0 then r=0 end
		mStr(r,-82,265)
		if r<21 and r>0 then
			gc.setLineWidth(4)
			gc.setColor(1,r>10 and 0 or rnd(),.5)
			gc.line(dx,600-30*r+dy,300+dx,600-30*r+dy)
		end
	end,
	score=function(P)return{P.stat.time,P.stat.piece}end,
	scoreDisp=function(D)return toTime(D[1]).."   "..D[2].." Pieces"end,
	comp=function(a,b)return a[1]<b[1]or a[1]==b[1]and a[2]<b[2]end,
	getRank=function(P)
		if P.stat.row<1000 then return end
		local T=P.stat.time
		return 
		T<=626 and 5 or
		T<=1000 and 4 or
		T<=1400 and 3 or
		T<=2200 and 2 or
		T<=3000 and 1 or
		0
	end,
}	