SMODS.Joker {
    key = 'chef',
    loc_txt = {
        name = 'Chef',
        text = { 'Creates a random {C:attention}Food{} Joker', 'when blind is selected' }
    },
    atlas = 'Jokers',
    pos = {
        x = 0,
        y = 2
    },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            local chosen_joker = nil
            while not chosen_joker or
                (chosen_joker.name == 'Cavendish' and not G.GAME.pool_flags.gros_michel_extinct) do
                chosen_joker = pseudorandom_element(food_jokers, pseudoseed('chef' .. G.GAME.round_resets.ante))
            end
            SMODS.add_card({
                set = 'Joker',
                key = chosen_joker.key,
                key_append = 'chef'
            })
            card:juice_up(0.3, 0.4)
            G.GAME.joker_buffer = G.GAME.joker_buffer - 1
        end
    end
}