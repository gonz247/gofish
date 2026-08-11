local ERRORS= require('errors')


local BaseCard = {}
BaseCard.__index = BaseCard

function BaseCard:new(number, suit, image, quad)
    assert(number, ERRORS.attributeIsRequired .. 'number')
    assert(suit, ERRORS.attributeIsRequired .. 'suit')

    local object = {
        number = number,
        suit = suit,
        image = image,
        quad = quad
    }
    setmetatable(object, self)
    -- object.type = self:getType()
    return object
end

function BaseCard:drawCard(...)
        love.graphics.draw(self.image, self.quad, ...)
end

function BaseCard:getType()
    return getmetatable(self)

end

function BaseCard:getValue()
    return self.number, self.suit
end

return BaseCard