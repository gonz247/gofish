local PokerSpriteSheet = require('src.entities.poker.poker_sp')
local PokerCard = require('src.entities.poker.poker_card')
local Deck = require('src.entities.deck')
local constants = require('src.commons.constants')

local Game = {}

local deck
local SCALE = 3
local CARD_W = 18 * SCALE
local CARD_H = 22 * SCALE
local PAD = 4

function Game.load()
    PokerSpriteSheet:load()

    local cards = {}
    for _, suit in ipairs(constants.BASE_POKER_SUITS) do
        for number = 0, 12 do
            table.insert(cards, PokerCard:new(number, suit, false))
        end
    end
    table.insert(cards, PokerCard:new(1, 'Jokers', true))
    table.insert(cards, PokerCard:new(2, 'Jokers', true))
    deck = Deck:new(cards, 'test')
end

function Game.draw()
    for i, card in ipairs(deck.cards) do
        local col = (i - 1) % 13
        local row = math.floor((i - 1) / 13)
        card:drawCard(col * (CARD_W + PAD), row * (CARD_H + PAD), 0, SCALE, SCALE)
    end
end

return Game
