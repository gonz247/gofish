local BaseCard = require('src.entities.base_card')
local PokerSpriteSheet = require('src.entities.poker.poker_sp')

local PokerCard = {}
PokerCard.__index = PokerCard
setmetatable(PokerCard, BaseCard) --explicit inheritance, no hidden nil args

function PokerCard:new(number, suit, isWild)
    local quad = PokerSpriteSheet:getQuad(suit, number)
    local object = BaseCard.new(self, number, suit, PokerSpriteSheet.image, quad)
    object.isWild = isWild or false
    setmetatable(object, self)
    return object
end

return PokerCard