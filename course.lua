require("obstacle")

Course = {}	--A rocket is a table
pSize = 0--STATIC

function Course:create(size)	--Add existing
	c = {}	--p is an array of several rockets
		pSize = size
		for i = 0, pSize do 
			c[i] = Obstacle:create(i)	--create #size Obstacles 
		end 

	setmetatable(c, { __index = Course })	--Yea, still no idea	

	return c
end 

function Course:draw()
	for k, v in pairs(self) do 
    	v:draw()
  	end 
end 

function Course:update(dt)
	for k, v in pairs(self) do --Updates all the rockets
    	v:update(dt)
  	end 

end 
