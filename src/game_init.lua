local Deck = require('src.entities.deck')
local PokerCard = require('src.entities.poker.poker_card')
local constants = require('src.commons.constants')

local function buildPokerDeck(owner)
    local cards = {}
    for _, suit in ipairs(constants.BASE_POKER_SUITS) do
        for i = 0, constants.BASE_CARDS_MAX_RANGE, 1 do
            table.insert(cards, PokerCard:new(i, suit, false))
        end
    end
    table.insert(cards, PokerCard:new(1, 'Jokers', true))
    table.insert(cards, PokerCard:new(2, 'Jokers', true))
    return Deck:new(cards, owner)
end

return { buildPokerDeck = buildPokerDeck }