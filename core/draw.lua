DrawableEntities = {}

function DrawableEntities:drawAll()
  for i, d in ipairs(DrawableEntities)
  do
    DrawableEntities[i]:draw()
  end
end

function DrawableEntities:add(entity)
  table.insert(DrawableEntities, entity)
end


return DrawableEntities