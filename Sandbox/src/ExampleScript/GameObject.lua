


GameObject = {x = 0.0, y = 0.0}
GameObject.adj = Adjective.NONE
GameObject.InputComponent = Input:new()
GameObject.sprite = nil
GameObject.tag = ""

-- GameObject.StopComponent = Stop:new()
-- GameObject.PushComponent = Push:new()



function GameObject:Update(dt)
    self.InputComponent:Update(dt)
end

function GameObject:Draw()
    -- DrawQuad(self.x, self.y , 1.0, 1.0,    1.0,1.0,1.0,1.0)
    DrawQuadRTex(self.sprite, self.x, self.y, 1.0, 1.0, math.rad(0.0))
end

-- function GameObject:GetGameObject(posX, posY)
    
--     self.y = self.y + offsetY
-- end


function GameObject:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    return o
end


LinkVerb = GameObject:new()
LinkVerb.sprite = sprites.isFont
LinkVerb.adj = Adjective.PUSH
LinkVerb.left = nil
LinkVerb.right = nil
LinkVerb.up = nil
LinkVerb.down = nil

LinkVerb.leftNounObjectTag = nil
LinkVerb.rightAdjectiveTag = nil


function LinkVerb:Update()
    self.left = GetGameObject(self.x -1, self.y)
    self.right = GetGameObject(self.x + 1, self.y)
    
    if self.left.tag == self.leftNounObjectTag and self.right.tag == self.rightAdjectiveTag then
        return
    end

    


    if self.left.tag == "None" or self.left.tag == "" or self.left.tag ~= self.leftNounObjectTag then
        local t = GetGameObjectsTableFromTag(self.leftNounObjectTag)
        print(#t)
        for _,o in pairs(t) do
            o.adj = Adjective.NONE
            
            o.InputComponent = Input:new()
        end
    end
    self.leftNounObjectTag = self.left.tag
    print(self.leftNounObjectTag)
    
    
    local t = GetGameObjectsTableFromTag(self.leftNounObjectTag)
    for _,o in pairs(t) do
        o.adj = GetAdjectiveFromTag(self.right.tag)
        if self.right.tag == "YOU" then
            o.InputComponent = PlayerInput:new{obj = o}
        else
            o.InputComponent = Input:new()
        end
    end

    self.rightAdjectiveTag = self.right.tag


end


