---@class PetalWingRenderer : Object
local PetalWingRenderer, super = Class(Object)

function PetalWingRenderer:init(owner, side)
    super.init(self, owner.x, owner.y)
    self.owner = owner
    self.side = side
    self.layer = owner:getRenderLayer(side)
end

function PetalWingRenderer:update()
    super.update(self)
    if not (self.owner and self.owner.parent) then
        self:remove()
        return
    end

    self.x = self.owner.x
    self.y = self.owner.y
    local layer = self.owner:getRenderLayer(self.side)
    if self.layer ~= layer then
        self:setLayer(layer)
    end
end

function PetalWingRenderer:draw()
    if not (self.owner and self.owner.parent) then
        return
    end

    if self.side == 0 and not self.owner.timerstart then
        self.owner:drawPetals()
    elseif self.side ~= 0 and self.owner.timerstart then
        self.owner:drawPetals(self.side)
    end
end

return PetalWingRenderer
