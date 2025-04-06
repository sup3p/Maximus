SMODS.Joker {
    key = 'brainwashed',
    loc_txt = {
        name = 'Brainwashed',
        text = {
            'If played hand contains a {C:attention}Flush{},',
            '{C:green}#1# in #2#{} chance to convert',
            'a {C:attention}random card held in hand{} to',
            'flush\'s suit after scoring'
        }
    },
    atlas = 'Placeholder',
    pos = {
        x = 1,
        y = 0
    },
    rarity = 1,
    config = {
        extra = {
            odds = 2
        }
    },
    blueprint_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        local stg = card.ability.extra
        return {
            vars = { G.GAME.probabilities.normal, stg.odds }
        }
    end,
    calculate = function(self, card, context)
        local stg = card.ability.extra
        if context.after and pseudorandom('bwash') < G.GAME.probabilities.normal / stg.odds and next(context.poker_hands['Flush']) then
            local valid_cards = {}
            local flush_suit = G.play.cards[1].base.suit

            for k, v in pairs(G.hand.cards) do
                if not v:is_suit(flush_suit, true) then
                    valid_cards[#valid_cards + 1] = v
                end
            end

            if next(valid_cards) then
                local chosen_card = pseudorandom_element(valid_cards, pseudoseed('bwash_card'))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.3,
                    func = function()
                        card:juice_up(0.3, 0.4)
                        play_sound('tarot1')
                        delay(0.3)
                        chosen_card:flip()
                        play_sound('card1', 1.15)
                        return true;
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        SMODS.change_base(chosen_card, flush_suit, nil)
                        return true;
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.3,
                    func = function()
                        chosen_card:flip()
                        play_sound('card1', 0.85)
                        return true;
                    end
                }))
            end
        end
    end
}
