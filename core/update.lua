function UpdateManager(dt)
    Physics.world:update(dt)
    Player:update(dt)
    Bullets:update(dt)
    Enemies:update(dt)
    Starfield:update(dt)
end

return UpdateManager