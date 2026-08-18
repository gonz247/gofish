-- TODO create deck objetc, it will recieve card base_card objects of any kind
local ERRORS= require('src.commons.errors')
local utils = require('src.commons.utils')
local BaseCard = require('src.entities.base_card')
local constants = require('src.commons.constants')


local Deck = {}
Deck.__index = Deck

function Deck:new(cards, owner)
    assert(owner, ERRORS.attributeIsRequired .. 'owner')
    assert(cards, ERRORS.attributeIsRequired .. 'cards')

    local object = {
        cards = cards,
        owner = owner,
        }
    setmetatable(object, self)
    return object
end

function Deck:getTotalCards()
    return #self.cards
end

function Deck:addCard(card)
    assert(
    utils.isInstanceOf(card, BaseCard),
    utils.formatErrorMessage(ERRORS.unexpectedTypeError, card.type, BaseCard.type)
    )
    table.insert(self.cards, card)
end

return Deck
