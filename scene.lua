game={}
function game.load()
	scene="load"
	curBG="none"
	keeprun=true
	loading=1--Loading mode
	loadnum=1--Loading counter
	loadprogress=0--Loading bar
end
function game.intro()
	scene="intro"
	curBG="none"
	count=0
	keeprun=true
end
function game.main()
	scene="main"
	curBG="none"
	keeprun=true
	BGM("blank")
	collectgarbage()
end
function game.mode()
	saveData()
	modeSel=modeSel or 1
	levelSel=levelSel or 3
	scene="mode"
	curBG="none"
	keeprun=true
	BGM("blank")
end
function game.custom()
	optSel=optSel or 1
	scene="custom"
	curBG="matrix"
	keeprun=true
	BGM("blank")
end
function game.play()
	scene="play"
	--curBG="game1"
	keeprun=false
	resetGameData()
	sysSFX("ready")
	mouseShow=false
end
function game.setting()
	scene="setting"
	curBG="none"
	keeprun=true
	BGM("blank")
end
function game.setting2()
	scene="setting2"
	curBG="none"
	keeprun=true
		curBoard=1
		keyboardSet=1
		joystickSet=1
		keyboardSetting=false
		joystickSetting=false
	BGM("blank")
end--Control settings
function game.setting3()
	scene="setting3"
	curBG="game1"
	keeprun=true
	defaultSel=1
	sel=nil
	snapLevel=1
	BGM("blank")
end--Touch setting
function game.help()
	scene="help"
	curBG="none"
	keeprun=true
	BGM("blank")
end
function game.stat()
	scene="stat"
	curBG="none"
	keeprun=true
	BGM("blank")
end
function game.quit()
	love.event.quit()
end