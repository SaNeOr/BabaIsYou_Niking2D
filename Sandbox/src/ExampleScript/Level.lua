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
	B.adj = Adjective.STOP
    table.insert(Objects, B)
    table.insert(Walls,  A)
    

	C = GameObject:new()
	C.sprite = sprites.rock
	C.x = -2
	C.y = -2
    C.InputComponent = Input:new()
    table.insert(Objects, C)
	table.insert(Rocks, C)
    C.adj = Adjective.NONE
    



    RockFont = GameObject:new()
    RockFont.tag = "Rock"
    RockFont.sprite = sprites.rockFont
    RockFont.x = -7
    RockFont.y = 0
    -- Is1.InputComponent = Input:new()
	table.insert(Objects, RockFont)
    RockFont.adj = Adjective.PUSH

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
	table.insert(Objects, PushFont)
    PushFont.adj = Adjective.PUSH


    BabaFont = GameObject:new()
    BabaFont.tag = "Baba"
    BabaFont.sprite = sprites.babaFont
    BabaFont.x = -7
    BabaFont.y = 3
    -- Is1.InputComponent = Input:new()
	table.insert(Objects, BabaFont)
    BabaFont.adj = Adjective.PUSH

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
	table.insert(Objects, YouFont)
    YouFont.adj = Adjective.PUSH



    -- for k,v in pairs(TagOfIs) do
    --     local noun = GetGameObject(v.x - 1, v.y)
    --     local adjective = GetGameObject(v.x + 1, v.y)
    --     v.noun = noun
    --     v.adjective = adjective

    --     if v.adjective.Tag == "Push" and v.noun.Tag == "Rock" then
    --         -- noun.tag == "Rock"
    --         for i,j in pairs(Rocks) do
    --             j.adj = Adjective.PUSH
    --         end
    --     end

    -- end


end


function Level:Update()
    for _, o in pairs(TagOfIs) do
        o:Update()
    end

    -- for _, o in pairs(TagOfIs) do
    --     o:Update()
    -- end
    -- for k,v in pairs(TagOfIs) do
    --     -- if v.noun == nil or v.adjective == nil then
    --     --     break
    --     -- end

    --     local noun = GetGameObject(v.x - 1, v.y)
    --     local adjective = GetGameObject(v.x + 1, v.y)

    --     if v.noun == noun and v.adjective == adjective then
    --         break
    --     end

    --     if noun == nil or adjective == nil then
    --         if v.noun == nil or v.adjective == nil then
    --             break
    --         end
    --         if v.noun.Tag == "Rock" then
    --             for i,j in pairs(Rocks) do
    --                 j.adj = Adjective.NONE
    --                 j.InputComponent = Input:new()
    --                 print("!!!!!!")
    --             end
    --         end
    --         v.noun = noun
    --         v.adjective = adjective
    --         break
    --     end

    --     v.noun = noun
    --     v.adjective = adjective

    --     if v.adjective.Tag == "Push" and v.noun.Tag == "Rock" then
    --         -- noun.tag == "Rock"
    --         for i,j in pairs(Rocks) do
    --             j.adj = Adjective.PUSH
    --         end
    --     end

    --     if v.adjective.Tag == "You" and v.noun.Tag == "Rock" then
    --         -- noun.tag == "Rock"
    --         for i,j in pairs(Rocks) do
    --             -- print(j.x)/
    --             j.adj = Adjective.YOU
    --             j.InputComponent = PlayerInput:new{obj = j}
    --         end
    --     end

        
    -- end
end