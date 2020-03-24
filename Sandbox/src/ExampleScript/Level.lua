-- require("src/ExampleScript/Obsever")
Adjective = {
    NONE    = 0,
    YOU     = 1,
    WIN     = 2,
    STOP    = 3,
    PUSH    = 4
}

Level = {}
Objects = {}

TagOfIs = {}

Rocks = {}
Walls = {}
Babas = {}



-- LinkVerbObserver = ConcreteObserver:new()

function GetGameObject(posX, posY)
    for k,v in pairs(Objects) do
        if v.x == posX and v.y == posY then
            return v
        end
    end
    return GameObject:new{tag = "None"}
end

function GetGameObjectsTableFromTag(tag)
    if  tag == "Rock" then
        return Rocks
    end
    if tag == "Baba" then
        return Babas
    end
    if tag == "Wall" then
        return Walls
    end
    return {}
end

function GetAdjectiveFromTag(tag)
    if  tag == "PUSH" then
        return Adjective.PUSH
    end
    if tag == "YOU" then
        return Adjective.YOU
    end
    if tag == "STOP" then
        return Adjective.STOP
    end

    return Adjective.NONE
end


function Level:Init()
    A = GameObject:new()

	A.sprite = sprites.baba
	A.InputComponent = PlayerInput:new{obj = A}
    table.insert(Objects, A)
    table.insert(Babas,  A)

	B = GameObject:new()
	B.sprite = sprites.wall
	B.x = 3
	B.y = 3
	-- B.InputComponent = Input:new()
	B.adj = Adjective.NONE
    table.insert(Objects, B)
    table.insert(Walls,  B)
    

	C = GameObject:new()
	C.sprite = sprites.rock
	C.x = -2
	C.y = -2
    -- C.InputComponent = Input:new()
    table.insert(Objects, C)
	table.insert(Rocks, C)
    C.adj = Adjective.NONE
    





    RockFont = GameObject:new()
    RockFont.tag = "Rock"
    RockFont.sprite = sprites.rockFont
    RockFont.x = -7
    RockFont.y = 0
    -- Is1.InputComponent = Input:new()
    RockFont.adj = Adjective.PUSH
	table.insert(Objects, RockFont)

    Is1 = LinkVerb:new()
    Is1.sprite = sprites.isFont
    Is1.x = -6
    Is1.y = 0
	table.insert(Objects, Is1)
	table.insert(TagOfIs, Is1)

    PushFont = GameObject:new()
    PushFont.tag = "PUSH"
    PushFont.sprite = sprites.pushFont
    PushFont.x = -5
    PushFont.y = 0
    -- Is1.InputComponent = Input:new()
    PushFont.adj = Adjective.PUSH
	table.insert(Objects, PushFont)


    BabaFont = GameObject:new()
    BabaFont.tag = "Baba"
    BabaFont.sprite = sprites.babaFont
    BabaFont.x = -7
    BabaFont.y = 3
    -- Is1.InputComponent = Input:new()
    BabaFont.adj = Adjective.PUSH
	table.insert(Objects, BabaFont)

    Is2 = LinkVerb:new()
    Is2.sprite = sprites.isFont
    Is2.x = -6
    Is2.y = 3
    -- Is1.InputComponent = Input:new()
	table.insert(Objects, Is2)
	table.insert(TagOfIs, Is2)

    YouFont = GameObject:new()
    YouFont.tag = "YOU"
    YouFont.sprite = sprites.youFont
    YouFont.x = -5
    YouFont.y = 3
    -- Is1.InputComponent = Input:new()
    YouFont.adj = Adjective.PUSH
	table.insert(Objects, YouFont)



    WallFont = GameObject:new()
    WallFont.tag = "Wall"
    WallFont.sprite = sprites.wallFont
    WallFont.x = -7
    WallFont.y = 5
    WallFont.adj = Adjective.PUSH
	table.insert(Objects, WallFont)

    Is3 = LinkVerb:new()
    Is3.sprite = sprites.isFont
    Is3.x = -6
    Is3.y = 5
	table.insert(Objects, Is3)
	table.insert(TagOfIs, Is3)

    StopFont = GameObject:new()
    StopFont.tag = "STOP"
    StopFont.sprite = sprites.stopFont
    StopFont.x = -5
    StopFont.y = 5
    StopFont.adj = Adjective.PUSH
	table.insert(Objects, StopFont)


    for _, o in pairs(TagOfIs) do
        o:Update()
    end
end


function Level:Update()
    for _, o in pairs(TagOfIs) do
        o:Update()
        o:Update()
    end
end