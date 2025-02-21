SMODS.Joker {
    key = 'zombie',
    loc_txt = {
        name = 'Zombie',
        text = { 'Copies the effect of {C:attention}one random Joker{}', 'each round. The target Joker will {C:attention}turn into', '{C:attention}another Zombie{} at the end of the round', '{C:inactive}All zombies target the same Joker', '{C:inactive}Zombification can be stopped by selling all other zombies', '{C:inactive}Current target: {C:red}#1#{}' }
    },
    atlas = 'Jokers',
    pos = {
        x = 7,
        y = 5
    },
    rarity = 2,
    config = {},
    blueprint_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, center)
        if G.GAME.current_round.zombie_target ~= nil then
            local copied_key = G.GAME.current_round.zombie_target.config.center.key
            info_queue[#info_queue + 1] = G.P_CENTERS[copied_key]
            return {
                vars = { G.localization.descriptions.Joker[copied_key].name }
            }
        else
            return {
                vars = { 'No valid target' }
            }
        end
    end,
    calculate = function(self, card, context)
        if G.GAME.current_round.zombie_target and not context.no_blueprint then
            context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
            context.blueprint_card = context.blueprint_card or card
            local zombie_target_ret = G.GAME.current_round.zombie_target:calculate_joker(context)
            context.blueprint = nil
            local eff_card = context.blueprint_card or self
            context.blueprint_card = nil
            if zombie_target_ret then
                zombie_target_ret.card = eff_card
                zombie_target_ret.colour = G.C.GREEN
                return zombie_target_ret
            end
        end
    end
}