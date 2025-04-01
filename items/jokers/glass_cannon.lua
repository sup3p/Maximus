SMODS.Joker {
    key = 'glass_cannon',
    loc_txt = {
        name = 'Glass Cannon',
        text = { 
            'All Joker {X:mult,C:white}XMult{} is {C:attention}retriggered', 
            '{C:attention}Shatters{} if blind isn\'t', 
            'beaten in 2 hands' 
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 7,
        y = 6
    },
    rarity = 3,
    config = {
        extra = {
            hands = 0
        }
    },
    blueprint_compat = true,
    eternal_compat = false,
    cost = 6,
    calculate = function(self, card, context)
        if context.other_ret
            and context.retrigger_joker_check and not context.retrigger_joker and context.cardarea ~= G.mxms_horoscope
            and (context.other_ret.jokers and (context.other_ret.jokers.Xmult or context.other_ret.jokers.Xmult_mod)) then
            return {
                message = localize('k_again_ex'),
                repetitions = 1,
                card = card
            }
        end

        if context.after and not context.blueprint then
            card.ability.extra.hands = card.ability.extra.hands + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    if card.ability.extra.hands == 2 and to_big(G.GAME.chips) - to_big(G.GAME.blind.chips) < to_big(0) then
                        card:shatter()
                    end
                    return true
                end
            }))
        end


        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            card.ability.extra.hands = 0
        end
    end
}
