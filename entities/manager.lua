DrawableEntities = require('core.draw')
UpdatableEntities = require('core.update')

Entities = {}

function Entities:updateAll(dt)
  for i, d in ipairs(Entities)
  do
    Entities[i]:update(dt)
  end
end

function Entities:add(entity, drawable, updatable)
  table.insert(Entities, entity)
  if drawable then
    DrawableEntities:add(entity)
  end
  if updatable then
    UpdatableEntities:add(entity)
  end
end


return Entities