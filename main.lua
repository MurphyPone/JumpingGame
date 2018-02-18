require("course")
require("obstacle")

function love.load()
	WIDTH = love.graphics.getWidth()
	HEIGHT = love.graphics.getHeight()

	gap = math.random(-100, 100)
	speed = 200

	love.physics.setMeter(128) --the height of a meter our worlds will be 64px
	world = love.physics.newWorld(0, 9.81*64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81

	objects = {} -- table to hold all our physical objects

	--let's create the ground
	ground = {}
	ground.body = love.physics.newBody(world, WIDTH/2, 650-50/2) --remember, the shape (the rectangle we create next) anchors to the body from its center, so we have to move it to (650/2, 650-50/2)
	ground.shape = love.physics.newRectangleShape(WIDTH, 50) --make a rectangle with a width of 650 and a height of 50
	ground.fixture = love.physics.newFixture(ground.body, ground.shape); --attach shape to body

	--let's create a ball
	ball = {}
	ball.body = love.physics.newBody(world, WIDTH/2, HEIGHT/2, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
	ball.shape = love.physics.newCircleShape(20) --the ball's shape has a radius of 20
	ball.fixture = love.physics.newFixture(ball.body, ball.shape, 1) -- Attach fixture to body and give it a density of 1.
	ball.fixture:setRestitution(0.2) --let the ball bounce

	createObjects()

	--initial graphics setup
	love.graphics.setBackgroundColor(104, 136, 248) --set the background color to a nice blue
	love.window.setMode(650, 650) --set the window dimensions to 650 by 650
end

function love.update(dt) 
 	--here we are going to create some keyboard events
  	if love.keyboard.isDown("up") then --press the up arrow key to set the ball in the air
    	ball.body:applyForce(0, -200)
  	elseif love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
   		ball.body:applyForce(-20, 0)
  	elseif love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
    	ball.body:applyForce(20, 0)
  	end

  	world:update(dt) --this puts the world into motion
  	updateObjects(dt)
end

function love.draw()
	love.graphics.setColor(72, 160, 14) -- set the drawing color to green for the ground
	love.graphics.polygon("fill", ground.body:getWorldPoints(ground.shape:getPoints())) -- draw a "filled in" polygon using the ground's coordinates
 
	love.graphics.setColor(193, 47, 14) --set the drawing color to red for the ball
	love.graphics.circle("fill", ball.body:getX(), ball.body:getY(), ball.shape:getRadius())
 
	love.graphics.setColor(50, 50, 50) -- set the drawing color to grey for the blocks
	love.graphics.polygon("fill", objects.block1.body:getWorldPoints(objects.block1.shape:getPoints()))
	love.graphics.polygon("fill", objects.block2.body:getWorldPoints(objects.block2.shape:getPoints()))
	love.graphics.polygon("fill", objects.block3.body:getWorldPoints(objects.block3.shape:getPoints()))
	love.graphics.polygon("fill", objects.block4.body:getWorldPoints(objects.block4.shape:getPoints()))
	love.graphics.polygon("fill", objects.block5.body:getWorldPoints(objects.block5.shape:getPoints()))
	love.graphics.polygon("fill", objects.block6.body:getWorldPoints(objects.block6.shape:getPoints()))
	love.graphics.polygon("fill", objects.block7.body:getWorldPoints(objects.block7.shape:getPoints()))
	love.graphics.polygon("fill", objects.block8.body:getWorldPoints(objects.block8.shape:getPoints()))


end

function updateObjects(dt)
	for k, v in pairs(objects) do 
		v.body:setX(v.body:getX()-speed*dt)
	end 

	if(objects.block1.body:getX() < 0 ) then 
		objects.block1.body:setX(WIDTH)
		objects.block2.body:setX(WIDTH)

		objects.block1.body:setY(gap)
		objects.block2.body:setY(HEIGHT+gap)

		gap = math.random(200)
	end 

	if(objects.block3.body:getX() < 0 ) then 
		objects.block3.body:setX(WIDTH)
		objects.block4.body:setX(WIDTH)

		objects.block3.body:setY(gap)
		objects.block4.body:setY(HEIGHT+gap)

		gap = math.random(200)
	end 

	if(objects.block5.body:getX() < 0 ) then 
		objects.block5.body:setX(WIDTH)
		objects.block6.body:setX(WIDTH)

		objects.block5.body:setY(gap)
		objects.block6.body:setY(HEIGHT+gap)

		gap = math.random(200)
	end 

	if(objects.block7.body:getX() < 0 ) then 
		objects.block7.body:setX(WIDTH)
		objects.block8.body:setX(WIDTH)

		objects.block7.body:setY(gap)
		objects.block8.body:setY(HEIGHT+gap)

		gap = math.random(200)
	end 
end 

function createObjects()
	--let's create a couple blocks to play around with
	objects.block1 = {}
	objects.block1.body = love.physics.newBody(world, WIDTH, gap )
	objects.block1.shape = love.physics.newRectangleShape(0, 0, 50, 450)
	objects.block1.fixture = love.physics.newFixture(objects.block1.body, objects.block1.shape, 5) -- A higher density gives it more mass.

	objects.block2 = {}
	objects.block2.body = love.physics.newBody(world, WIDTH, HEIGHT + gap)
	objects.block2.shape = love.physics.newRectangleShape(0, 0, 50, 450)
	objects.block2.fixture = love.physics.newFixture(objects.block2.body, objects.block2.shape, 2)

	--let's create a couple blocks to play around with
	objects.block3 = {}
	objects.block3.body = love.physics.newBody(world, WIDTH + 200, gap )
	objects.block3.shape = love.physics.newRectangleShape(0, 0, 50, 450)
	objects.block3.fixture = love.physics.newFixture(objects.block3.body, objects.block3.shape, 5) -- A higher density gives it more mass.

	objects.block4 = {}
	objects.block4.body = love.physics.newBody(world, WIDTH + 200, HEIGHT + gap)
	objects.block4.shape = love.physics.newRectangleShape(0, 0, 50, 450)
	objects.block4.fixture = love.physics.newFixture(objects.block4.body, objects.block4.shape, 2)

	--let's create a couple blocks to play around with
	objects.block5 = {}
	objects.block5.body = love.physics.newBody(world, WIDTH + 400, gap )
	objects.block5.shape = love.physics.newRectangleShape(0, 0, 50, 450)
	objects.block5.fixture = love.physics.newFixture(objects.block5.body, objects.block5.shape, 5) -- A higher density gives it more mass.

	objects.block6 = {}
	objects.block6.body = love.physics.newBody(world, WIDTH + 400, HEIGHT + gap)
	objects.block6.shape = love.physics.newRectangleShape(0, 0, 50, 450)
	objects.block6.fixture = love.physics.newFixture(objects.block6.body, objects.block6.shape, 2)

	--let's create a couple blocks to play around with
	objects.block7 = {}
	objects.block7.body = love.physics.newBody(world, WIDTH + 600, gap )
	objects.block7.shape = love.physics.newRectangleShape(0, 0, 50, 450)
	objects.block7.fixture = love.physics.newFixture(objects.block7.body, objects.block7.shape, 5) -- A higher density gives it more mass.

	objects.block8 = {}
	objects.block8.body = love.physics.newBody(world, WIDTH + 600, HEIGHT + gap)
	objects.block8.shape = love.physics.newRectangleShape(0, 0, 50, 450)
	objects.block8.fixture = love.physics.newFixture(objects.block8.body, objects.block8.shape, 2)
end 

