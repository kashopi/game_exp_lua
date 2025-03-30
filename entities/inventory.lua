--[[

function add_w_to_inventory()
   local iw = get_random_number(1, 10)

end

if love.keyboard.isDown("space") then print_inventory() end


]]--

Inventory = {}


function Inventory:init()
    self.items = {
        weapons = {},
        ammo = {},
        objects = {},
    }
end


function Inventory:add_weapon(weapon)
    if not Table_has(self.items.weapons, weapon) then
        table.insert(self.items.weapons, weapon)
    end
end

function Inventory:add_ammo(weapon, quantity)
    if not Table_has(self.items.ammo, weapon) then
        table.insert(self.items.ammo, weapon)
    end
    self.items.ammo[weapon] = self.items.ammo[weapon] + quantity
end