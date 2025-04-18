SMODS.Joker {
    key = 'gelatin',
    loc_txt = {
        name = 'Gelatin',
        text = { 'Retriggers the next', '{C:attention}#1#{} scored {V:1}#2#{}', '{s:0.8,C:inactive}Suit changes each round' }
    },
    atlas = 'Jokers',
    pos = {
        x = 6,
        y = 10
    },
    rarity = 2,
    config = {
        extra = {
            cards_left = 50
        }
    },
    blueprint_compat = false,
    cost = 4,
    pools = {
        Food = true
    },
    loc_vars = function(self, info_queue, card)
        local stg = card.ability.extra
        return {
            vars = { stg.cards_left, G.GAME.current_round.jello_suit,
                colours = {G.C.SUITS[G.GAME.current_round.jello_suit]} 
            }
        }
    end,
    calculate = function(self, card, context)
        local stg = card.ability.extra
        if context.cardarea == G.play and context.repetition and stg.cards_left > 0 then
            if context.other_card:is_suit(G.GAME.current_round.jello_suit) then
                stg.cards_left = stg.cards_left - 1
                return {
                    repetitions = 1,
                    message = localize('k_again_ex'),
                    card = card
                }
            end
        end

        if context.after and not context.blueprint then
            if stg.cards_left <= 0 then
                -- Code derived from Gros Michel/Cavendish
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot2')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                                return true;
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = 'Eaten'
                }
            end
        end

    end
}
