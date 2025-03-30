UpdatableEntities = {}

function UpdatableEntities:updateAll(dt)
  for i, d in ipairs(UpdatableEntities)
  do
    UpdatableEntities[i]:update(dt)
  end
end

function UpdatableEntities:add(entity)
  table.insert(UpdatableEntities, entity)
end


return UpdatableEntities