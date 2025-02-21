SMODS.Joker {
    key = 'bell_curve',
    loc_txt = {
        name = 'Bell Curve',
        text = { 'Approximately {X:mult,C:white}X#1#{} Mult,', 'Changes sigmoidially according to',
            'deck size\'s deviation', 'from {C:attention}52{}' }
    },
    atlas = 'Jokers',
    pos = {
        x = 8,
        y = 3
    },
    rarity = 2,
    config = {
        extra = {
            Xmult = 3
        }
    },
    blueprint_compat = true,
    cost = 7,
    loc_vars = function(self, info_queue, center)
        local calc = 3
        if G.playing_cards ~= nil then
            calc = 2 * math.exp(-(((#G.playing_cards - 52) ^ 2) / 250)) + 1
        end
        return {
            vars = { calc }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.Xmult = 2 * math.exp(-(((#G.playing_cards - 52) ^ 2) / 250)) + 1
            return {
                Xmult_mod = card.ability.extra.Xmult,
                message = 'X' .. card.ability.extra.Xmult,
                colour = G.C.MULT,
                card = card
            }
        end
    end
}