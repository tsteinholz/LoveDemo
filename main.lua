require('camera');

function love.load()
  love.graphics.setBackgroundColor(124, 65, 225);
  floor = love.graphics.newImage('Resources/Objects/Floor.png');
  edge  = love.graphics.newImage('Resources/Objects/Edge.png');
  wall  = love.graphics.newImage('Resources/Objects/Wall.png');

  camera.layers = {};
  local scale = 0.5;
  camera:newLayer(scale, function()
    

    local floorWidth, floorHeight = floor:getWidth()*scale, floor:getHeight()*scale
    local next = 0
    love.graphics.draw(edge, 0, love.graphics.getHeight() - (floorHeight), 0, scale, scale)
    for i=floorWidth, love.graphics.getWidth()-floorWidth, floorWidth do
      love.graphics.draw(floor, i, love.graphics.getHeight() - (floorHeight), 0, scale, scale)
      next = i + 2 *floorWidth
    end
  love.graphics.draw(edge, next, love.graphics.getHeight(), math.rad(180), scale, scale)
  end)
end

function love.draw()
  camera:draw();
  love.graphics.print("FPS: " .. love.timer.getFPS(), 2, 2)
end

function love.update(dt)
  camera:setPosition(love.mouse.getX(), love.mouse.getY())
end

-- TODO : Add Wall
-- TODO : Add Player
-- TODO : Add Intractable Physics Objects
