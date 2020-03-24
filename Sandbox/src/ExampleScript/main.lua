function Init()
	sprites =  {}
	sprites.baba	= LoadTexture("assets/textures/baba_0_1.png")
	sprites.wall	= LoadTexture("assets/textures/wall_0_1.png")
	sprites.rock	= LoadTexture("assets/textures/rock_0_1.png")
	sprites.flag	= LoadTexture("assets/textures/flag_0_1.png")

	sprites.rockFont= LoadTexture("assets/textures/text_rock_0_1.png")
	sprites.babaFont= LoadTexture("assets/textures/text_baba_0_1.png")
	sprites.wallFont= LoadTexture("assets/textures/text_wall_0_1.png")
	sprites.flagFont= LoadTexture("assets/textures/text_flag_0_1.png")
	
	sprites.isFont	= LoadTexture("assets/textures/text_is_0_1.png")
	
	sprites.pushFont= LoadTexture("assets/textures/text_push_0_1.png")
	sprites.youFont	= LoadTexture("assets/textures/text_you_0_1.png")
	sprites.stopFont= LoadTexture("assets/textures/text_stop_0_1.png")
	sprites.winFont	= LoadTexture("assets/textures/text_win_0_1.png")

	-- sprites.player = LoadTexture("assets/textures/Ship.png")
	-- sprites.triangle = LoadTexture("assets/textures/Triangle.png")


	require("src/ExampleScript/Level")
	require("src/ExampleScript/Input")
	require("src/ExampleScript/GameObject")

	Level:Init()
	GlobalInput:Init()
	GameState = {State = -1, Play = 0, MainMenu =1, GameOver = 2}
	GameState.State = GameState.MainMenu

	-- SetCameraPosition(player.position.x, player.position.y )
end



FlashTime = 0.0

function Update(dt)

	if GameState.State == GameState.Play then
		Level:Update()
		GlobalInput:Update(dt)
		for k,v in pairs(Objects) do
			v:Update(dt)
		end
	end

	math.randomseed(os.time())
	FlashTime = FlashTime + dt
	if FlashTime > (math.random(15, 20) / 10.0) then
		FlashTime = 0.0
	end

end



function Draw()
	if GameState.State ~= GameState.Play then
		DrawQuad(0, 0,   50,50 , 0,0,0,1)
	end
	-- DrawQuad(-5.0, 5.0,10,5 , 0,1,0,1)
	-- DrawQuadZ(0.0, 0.0, -0.5, 10, 16 , 0,0,1,1)
	-- level.Draw()
	-- player.Draw()
	-- A:Draw()
	-- Objects.B:Draw()
	for k,v in pairs(Objects) do
		v:Draw()
		if v.adj == Adjective.YOU then
			v.InputComponent:ParticleDraw()
		end
	end

end




function DrawUI()
	if GameState.State == GameState.Play then

		context = "Step: " .. math.floor( GlobalInput:GetStep() )
		DrawFont(context, -12.0, -12.0, 32.0)
	elseif GameState.State == GameState.MainMenu then
		local offset = {x = Width * 0.5 - 400, y = 50}

		DrawFont("Baba Is You!", offset.x, offset.y, 120.0)
		if FlashTime >= (math.random(0, 10) / 10.0)  then
			DrawFont("- Clik to start -", offset.x + 150, offset.y + 150, 45.0)
		end

	elseif GameState.State == GameState.GameOver then
		local offset = {x = Width * 0.5 - 400, y = 50}
		DrawFont("Game Over", offset.x, offset.y, 120.0)
		offset.x = offset.x + 200.0
		offset.y = offset.y + 150.0
		DrawFont(context, offset.x, offset.y, 48.0)
	end

end


function OnMouseButtonPressed()
	if GameState.State == GameState.GameOver then
		GlobalInput:Reset()
	end

	GameState.State = GameState.Play
end


