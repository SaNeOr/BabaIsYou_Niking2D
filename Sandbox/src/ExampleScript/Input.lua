AllObjectsTrace = {}


Input = {}
function Input:AddTrace()
    table.insert( AllObjectsTrace,  {})
    for _,v in pairs(Objects) do
        local pos = {x = v.x , y = v.y}
        table.insert( AllObjectsTrace[#AllObjectsTrace], pos)
    end
    print("AddTace: ", #AllObjectsTrace)

end

function Input:Update(dt)
end

function Input:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    return o
end


GlobalInput = Input:new()
GlobalInput.time = 0.0
GlobalInput.inputInterval =  0.3
GlobalInput.isPressed = true
GlobalInput.firstPressed = true


function GlobalInput:Init()
    Input:AddTrace()
end

function GlobalInput:Update(dt)
    if self.isPressed == true then
        self.time  = self.time + dt
        if(self.time > self.inputInterval) then
            self.time = 0.0
            self.isPressed = false
        end
    end

    if IsKeyPressed("space") and self.isPressed == false then
        self.isPressed = true
        if #AllObjectsTrace >= 2 and GlobalInput.firstPressed then
            table.remove(AllObjectsTrace)
            GlobalInput.firstPressed = false
        end
        GlobalInput:Undo()
    end
end

function GlobalInput:Undo()
    if #AllObjectsTrace <= 0 then
        return
    end
    local trace = table.remove(AllObjectsTrace)
    print("RemoveTace: ", #AllObjectsTrace)

        for _,o in pairs(trace) do
            -- print
        end
    for i, o in pairs(Objects) do
        o.x = trace[i].x
        o.y = trace[i].y
        -- print(trace[i].x, trace[i].y)
    end

end

PlayerInput = Input:new()

PlayerInput.time = 0.0
PlayerInput.inputInterval =  0.3
PlayerInput.isPressed = true
PlayerInput.obj = nil

function PlayerInput:Update(dt)
    if self.isPressed == true then
        self.time  = self.time + dt
        if(self.time > self.inputInterval) then
            self.time = 0.0
            self.isPressed = false
        end
    end

    self:Move("W",  0,  1)
    self:Move("S",  0, -1)
    self:Move("A", -1,  0)
    self:Move("D",  1,  0)
end

function PlayerInput:Move(keycode, offsetX , offsetY)
    if IsKeyPressed(keycode) and self.isPressed == false then
        self.isPressed = true
        local obj = GetGameObject(self.obj.x + offsetX, self.obj.y + offsetY)
        if obj ~= nil then
            if obj.adj == Adjective.STOP then
                return
            end
            if obj.adj == Adjective.PUSH then
                -- PlayerInput:Push(self.obj, offsetX, offsetY)
                for i=1,#Objects do
                    obj = GetGameObject(self.obj.x + offsetX * i, self.obj.y + offsetY * i)
                    if obj.tag == "None" or obj.adj == Adjective.NONE then
                        -- print(i)
                        for k = i-1, 1,-1 do
                            obj = GetGameObject(self.obj.x + offsetX * k, self.obj.y + offsetY * k)
                            obj.x = obj.x + offsetX
                            obj.y = obj.y + offsetY
                        end
                        break
                    end
                    if obj.adj == Adjective.STOP then
                        return
                    end
                end
            end
        end
        self.obj.x = self.obj.x + offsetX
        self.obj.y = self.obj.y + offsetY
        GlobalInput.firstPressed = true
        Input:AddTrace()
    end
end




function PlayerInput:Push(obj, dx, dy)
    -- if GetGameObject(self.obj.x + offsetX, self.obj.y + offsetY) == nil then


    local posX = obj.x + dx
    local posY = obj.y + dy
    local obj = GetGameObject(posX, posY)
    if obj == nil then
        return
    end
    -- if obj ~= nil then
    --     obj.x = obj.x + 1
    -- end

    for i=1,#Objects do
        local obj = GetGameObject(posX, posY)
        if obj == nil then
            break
        end
        if obj.adj == Adjective.STOP then
            return
        end
        posX = obj.x + dx
        posY = obj.y + dy
    end

    posX = obj.x + dx
    posY = obj.y + dy
    for i=1,#Objects do
        local obj = GetGameObject(posX, posY)
        if obj == nil then
            break
        end
        obj.x = obj.x + dx
        obj.y = obj.y + dy
        posX = obj.x + dx
        posY = obj.y + dy
    end

end