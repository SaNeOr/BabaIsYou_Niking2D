function Init()
	sprites =  {}
	sprites.baba	= LoadTexture("assets/textures/baba_0_1.png")
	sprites.wall	= LoadTexture("assets/textures/wall_0_1.png")
	sprites.rock	= LoadTexture("assets/textures/rock_0_1.png")

	sprites.rockFont= LoadTexture("assets/textures/text_rock_0_1.png")
	sprites.babaFont= LoadTexture("assets/textures/text_baba_0_1.png")
	sprites.wallFont= LoadTexture("assets/textures/text_wall_0_1.png")
	
	sprites.isFont	= LoadTexture("assets/textures/text_is_0_1.png")
	
	sprites.pushFont= LoadTexture("assets/textures/text_push_0_1.png")
	sprites.youFont= LoadTexture("assets/textures/text_you_0_1.png")

	-- sprites.player = LoadTexture("assets/textures/Ship.png")
	-- sprites.triangle = LoadTexture("assets/textures/Triangle.png")


	require("src/ExampleScript/Level")
	require("src/ExampleScript/Input")
	require("src/ExampleScript/GameObject")

	Level:Init()

	GameState = {State = -1, Play = 0, MainMenu =1, GameOver = 2}
	GameState.State = GameState.MainMenu

	-- SetCameraPosition(player.position.x, player.position.y )

end

function Update(dt)
	
	-- A:Update(dt)
	-- Objects.A:Update(dt)

	-- Objects.B:Update(dt)
	Level:Update()
	Level:Update()

	for k,v in pairs(Objects) do
		v:Update(dt)
	end
	-- Objects[1].Update(dt)

	-- A.InputComponent:Update(dt, A)

	if GameState.State == GameState.Play then
		-- player:Update(dt)
		-- SetCameraPosition(player.position.x, player.position.y )
		-- level:Update()
	end
end

function Draw()
	-- DrawQuad(0, 0,   5,5 , 1,0,0,1)
	-- DrawQuad(-5.0, 5.0,10,5 , 0,1,0,1)
	-- DrawQuadZ(0.0, 0.0, -0.5, 10, 16 , 0,0,1,1)
	-- level.Draw()
	-- player.Draw()
	-- A:Draw()
	-- Objects.B:Draw()
	for k,v in pairs(Objects) do
		v:Draw()
	end
end


function DrawUI()
	if GameState.State == GameState.Play then
		-- context = "Score: " .. math.floor( player:GetScore() )
		-- DrawFont(context, 0.0, 0.0, 120.0)
	elseif GameState.State == GameState.MainMenu then
		local offset = {x = Width * 0.5 - 400, y = 50}
		DrawFont("Click to Play!", offset.x, offset.y, 120.0)
	elseif GameState.State == GameState.GameOver then
		-- local offset = {x = Width * 0.5 - 400, y = 50}
		-- DrawFont("Click to Play!", offset.x, offset.y, 120.0)
		-- offset.x = offset.x + 200.0
		-- offset.y = offset.y + 100.0
		-- DrawFont(context, offset.x, offset.y, 48.0)

	end
end


function OnMouseButtonPressed()
	if GameState.State == GameState.GameOver then
		player:Reset()
	end

	GameState.State = GameState.Play
end


