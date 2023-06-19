function love.load()
   love.window.setTitle("Two Player Game")
   love.window.setMode(1280, 720, {resizable = true})
   
   player1 = {}
   player1.x = 100
   player1.y = 200
   player1.speed = 200
   player1.radius = 25
   player1.color = {0, 255, 0} 

   player2 = {}
   player2.x = 400
   player2.y = 200
   player2.speed = 200
   player2.size = 50
   player2.color = {255, 0, 0} 
end

function love.update(dt)
  
   if love.keyboard.isDown("left") and player1.x > 0 then
      player1.x = player1.x - player1.speed * dt
   elseif love.keyboard.isDown("right") and player1.x < love.graphics.getWidth() - player1.radius * 2 then
      player1.x = player1.x + player1.speed * dt
   elseif love.keyboard.isDown("up") and player1.y > 0 then
      player1.y = player1.y - player1.speed * dt
   elseif love.keyboard.isDown("down") and player1.y < love.graphics.getHeight() - player1.radius * 2 then
      player1.y = player1.y + player1.speed * dt
   end

 
   if love.keyboard.isDown("a") and player2.x > 0 then
      player2.x = player2.x - player2.speed * dt
   elseif love.keyboard.isDown("d") and player2.x < love.graphics.getWidth() - player2.size then
      player2.x = player2.x + player2.speed * dt
   elseif love.keyboard.isDown("w") and player2.y > 0 then
      player2.y = player2.y - player2.speed * dt
   elseif love.keyboard.isDown("s") and player2.y < love.graphics.getHeight() - player2.size then
      player2.y = player2.y + player2.speed * dt
   end

  
   if player1.x < 0 then
      player1.x = 0
   elseif player1.x > love.graphics.getWidth() - player1.radius * 2 then
      player1.x = love.graphics.getWidth() - player1.radius * 2
   end
   if player1.y < 0 then
      player1.y = 0
   elseif player1.y > love.graphics.getHeight() - player1.radius * 2 then
      player1.y = love.graphics.getHeight() - player1.radius * 2
   end

   
   if player2.x < 0 then
      player2.x = 0
   elseif player2.x > love.graphics.getWidth() - player2.size then
      player2.x = love.graphics.getWidth() - player2.size
   end
   if player2.y < 0 then
      player2.y = 0
   elseif player2.y > love.graphics.getHeight() - player2.size then
      player2.y = love.graphics.getHeight() - player2.size
   end
end

function love.draw()
   love.graphics.setBackgroundColor(255, 255, 255)
   
  
   love.graphics.setColor(player1.color)
   love.graphics.circle("fill", player1.x, player1.y, player1.radius)

   
   love.graphics.setColor(player2.color)
   love.graphics.rectangle("fill", player2.x, player2.y, player2.size, player2.size)
end

function love.resize(w, h)
  
   player1.x = math.min(player1.x, w - player1.radius * 2)
   player1.y = math.min(player1.y, h - player1.radius * 2)
   
   player2.x = math.min(player2.x, w - player2.size)
   player2.y = math.min(player2.y, h - player2.size)
end
