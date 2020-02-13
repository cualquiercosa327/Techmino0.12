local max,rnd=math.max,math.random
return{
	name={
		"挖掘",
		"挖掘",
		"Dig",
	},
	level={
		"困难",
		"困难",
		"HARD",
	},
	info={
		"挖掘练习",
		"挖掘练习",
		"Downstack!",
	},
	color=color.magenta,
	env={
		drop=60,lock=120,
		fall=20,
		freshLimit=15,
		task=function(P)
			if not P.control then return end
			P.modeData.counter=P.modeData.counter+1
			if P.modeData.counter>=max(90,180-P.modeData.event)then
				P.modeData.counter=0
				P:garbageRise(10,1,rnd(10))
				P.modeData.event=P.modeData.event+1
			end
		end,
		bg="game2",bgm="push",
	},
	load=function()
		newPlayer(1,340,15)
	end,
	mesDisp=function(P,dx,dy)
		setFont(65)
		mStr(P.modeData.event,-82,310)
		mDraw(drawableText.wave,-82,375)
	end,
	score=function(P)return{P.modeData.event,P.stat.row}end,
	scoreDisp=function(D)return D[1].." Waves   "..D[2].." Lines"end,
	comp=function(a,b)return a[1]>b[1]or a[1]==b[1]and a[2]<b[2]end,
	getRank=function(P)
		local W=P.modeData.event
		return
		W>=150 and 5 or
		W>=110 and 4 or
		W>=80 and 3 or
		W>=50 and 2 or
		W>=20 and 1
	end,
}