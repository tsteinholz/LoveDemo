function love.load()
  --love.graphics.setBackgroundColor(124, 65, 225)
  love.graphics.setBackgroundColor(255,255,255)
  floor = love.graphics.newImage('Resources/Objects/Floor.png')
  edge  = love.graphics.newImage('Resources/Objects/Edge.png')
end

function love.draw()
  love.graphics.print("This is a demo world")
  drawFloor()

end

function drawFloor()
  local scale = 0.5;
  local floorWidth, floorHeight = floor:getWidth()*scale, floor:getHeight()*scale
  local next = 0
  love.graphics.draw(edge, 0, love.graphics.getHeight() - (floorHeight), 0, scale, scale)
  for i=floorWidth, love.graphics.getWidth()-floorWidth, floorWidth do
    love.graphics.draw(floor, i, love.graphics.getHeight() - (floorHeight), 0, scale, scale)
    next = i + 2 *floorWidth
  end
  love.graphics.draw(edge, next, love.graphics.getHeight(), math.rad(180), scale, scale)
end
