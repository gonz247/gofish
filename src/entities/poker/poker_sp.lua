local constants = require('src.commons.constants')


local PokerSpriteSheet = {
    texture_atlas_lookup_table = {}
}

function PokerSpriteSheet:load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    PokerSpriteSheet.image  = love.graphics.newImage('src/assets/sprites/poker nano.png')
    PokerSpriteSheet.card_w = 18
    PokerSpriteSheet.card_h = 22
    self:getAllQuads()
    self:getJokerQuads()
end

function PokerSpriteSheet:getQuad(suit, number)
    return self.texture_atlas_lookup_table[suit][number]
end

function PokerSpriteSheet:getAllQuads()
    for i = 1, #constants.BASE_POKER_SUITS do
        local suit = constants.BASE_POKER_SUITS[i]
        self.texture_atlas_lookup_table[suit] = {}
        for j = 0, 12 do
            self.texture_atlas_lookup_table[suit][j] = love.graphics.newQuad(
                j * self.card_w,
                (i - 1) * self.card_h, -- sprite rows are 0-based
                self.card_w,
                self.card_h,
                self.image
            )
        end
    end
end

function PokerSpriteSheet:getJokerQuads()
    self.texture_atlas_lookup_table['Jokers'] = {}
    table.insert(self.texture_atlas_lookup_table['Jokers'], love.graphics.newQuad(
                0 * self.card_w,
                4 * self.card_h, -- suits occupy rows 0-3, jokers are row 4
                self.card_w,
                self.card_h,
                self.image
            ))
    table.insert(self.texture_atlas_lookup_table['Jokers'], love.graphics.newQuad(
                1 * self.card_w,
                4 * self.card_h,
                self.card_w,
                self.card_h,
                self.image
            ))
end

return PokerSpriteSheet