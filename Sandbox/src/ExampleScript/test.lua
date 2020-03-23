Input = {}
function Input:Move()
    print("!!")
end

function Input:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    return o
end

PlayerInput = Input:new()
function PlayerInput:Move()
    print("????????")

end

GameObject = {}

GameObject.x = 5
GameObject.y = 10
GameObject.t = Input:new()

function GameObject:Fuck()
    self.t:Move()
end

function GameObject:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    return o
end


boy =  GameObject:new()
boy.t = PlayerInput:new()


-- FuckObject = GameObject:new{fuck = 100}
-- print(FuckObject.fuck)
Apinput = PlayerInput:new{obj = boy}

function Apinput:Fuck()
    print(self.obj.x + 5)
end

-- Apinput:Fuck()
print(nil==nil)
-- GameObject.t = 

-- print(boy.x)
-- boy:Fuck()

-- Objs = {}

-- table.insert( Objs, 30 )
-- table.insert( Objs, 10 )
-- table.insert( Objs, 2 )

Objs = {}
table.insert( Objs, GameObject:new())
Objs[1].x = 100
table.insert( Objs, GameObject:new())

-- for key, value in pairs(Objs) do 
--     -- print(Objs[key])
--     print(value.x)
-- end


A = {}
-- A[0] = 0
A[1] = 0
A[2] = 1
A[3] = 1
A[4] = 1


flag = false
function foo(index)
    if index == 0 then
        return 
    end
    if A[index] == 1 then
        flag = true
    else
        flag = false
    end
    foo(index-1)
    if  flag == true then
        A[index] = A[index] + 1
    end
end

-- print(fib(5))
-- foo(4)
-- for i,v in ipairs(A) do
--     print(i,v)
-- end

-- for i = 5,0,-1 do 
--     print(i)
-- end


A = {}
A[1] = 5
A[2] = 10
A.t = 22

B = {}
B.x = A




-- debug.sethook(print, 5)
-- print(B.x == A)
-- for i,v in pairs(A) do
--     print(i,v)
-- end
-- -- A[3] = B
-- B = {}
-- table.insert( A, B )
-- B.x = 255
-- B.t = A

-- print(A[3])
-- print(B.t[2])


for _,v in pairs(A) do
    print(_)
end