SMODS.Joker {
    key = 'light_show',
    loc_txt = {
        name = 'Light Show',
        text = { 'Retriggers all {C:mult}Mult{}', 'and {C:chips}Bonus{} cards' }
    },
    atlas = 'Jokers',
    pos = {
        x = 5,
        y = 4
    },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
        info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
        return {}
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and
            (context.other_card.config.center == G.P_CENTERS.m_bonus or context.other_card.config.center ==
                G.P_CENTERS.m_mult) then
            return {
                message = localize('k_again_ex'),
                repetitions = 1,
                card = card
            }
        end
    end,
    in_pool = function(self, args)
        for k, v in pairs(G.playing_cards) do
            if SMODS.has_enhancement(v, 'm_bonus') or SMODS.has_enhancement(v, 'm_mult') then
                return true
            end
        end

        return false
    end
}
