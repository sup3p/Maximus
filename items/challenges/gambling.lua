SMODS.Challenge {
    key = 'gambling',
    loc_txt = {
        name = 'Let\'s Go Gambling!'
    },
    rules = {
        custom = {
            { id = 'no_extra_hand_money' },
            { id = 'no_reward' },
            { id = 'no_interest' }
        },
        modifiers = {
            { id = 'dollars', value = 10 }
        }
    },
    jokers = {},
    restrictions = {
        banned_cards = {
            { id = 'c_temperance' },
            { id = 'c_hermit' },
            { id = 'c_devil' },
            { id = 'c_magician' },
            { id = 'c_immolate' },
            { id = 'c_talisman' },
            { id = 'j_egg' },
            { id = 'j_matador' },
            { id = 'j_golden' },
            { id = 'j_delayed_grat' },
            { id = 'j_business' },
            { id = 'j_faceless' },
            { id = 'j_todo_list' },
            { id = 'j_cloud_9' },
            { id = 'j_rocket' },
            { id = 'j_gift' },
            { id = 'j_reserved_parking' },
            { id = 'j_mail' },
            { id = 'j_to_the_moon' },
            { id = 'j_trading' },
            { id = 'j_ticket' },
            { id = 'j_rough_gem' },
            { id = 'j_satellite' },
            { id = 'j_mxms_gambler' },
            { id = 'j_mxms_jackpot' },
            { id = 'j_mxms_four_course_meal' },
            { id = 'j_mxms_hypeman' },
            { id = 'c_mxms_capricorn' },
            { id = 'c_mxms_aquarius' },
            { id = 'v_seed_money' },
            { id = 'v_money_tree' },
        },
        banned_tags = {
            { id = 'tag_uncommon' },
            { id = 'tag_rare' },
            { id = 'tag_negative' },
            { id = 'tag_foil' },
            { id = 'tag_holo' },
            { id = 'tag_polychrome' },
            { id = 'tag_voucher' },
            { id = 'tag_boss' },
            { id = 'tag_standard' },
            { id = 'tag_charm' },
            { id = 'tag_meteor' },
            { id = 'tag_buffoon' },
            { id = 'tag_handy' },
            { id = 'tag_garbage' },
            { id = 'tag_ethereal' },
            { id = 'tag_coupon' },
            { id = 'tag_double' },
            { id = 'tag_juggle' },
            { id = 'tag_d_six' },
            { id = 'tag_top_up' },
            { id = 'tag_orbital' },
            { id = 'tag_mxms_star' },
        }
    },
    deck = {
        type = 'Challenge Deck'
    }
}
