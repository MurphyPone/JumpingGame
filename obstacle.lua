Obstacle = {}	--An obstacle is a table

function Obstacle:create(num)	
	o = {}		
		o.width = math.random(60,80) 
		o.height = 30
		o.x = (WIDTH + math.random(100, 150)*num + o.width)
		o.y = math.random(HEIGHT- 200, HEIGHT - 50)

		--gene counter 
		o.speed = 300-- pixels to move per step
		o.rotation = math.random(0, 2*math.pi) --no rotation to begin with

		setmetatable(o, { __index = Obstacle })	--Yea, still no idea
	return o
end

function Obstacle:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end 

function Obstacle:update(dt)
	self.x = self.x - self.speed * dt 

	if(self.x < -self.width) then 
		self.x = (WIDTH + math.random(100, 150) + self.width)
		self.y = math.random(HEIGHT- 200, HEIGHT - 50)

	end 
end 