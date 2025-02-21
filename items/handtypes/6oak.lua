SMODS.PokerHand {
    key = '6oak',
    mult = 18,
    chips = 180,
    l_mult = 4,
    l_chips = 40,
    example = {

        { 'S_K', true },
        { 'D_K', true },
        { 'C_K', true },
        { 'H_K', true },
        { 'S_K', true },
        { 'D_K', true }

    },
    loc_txt = {
        name = 'Six of a Kind',
        description = {
            "6 cards with the same rank"
        }
    },
    visible = false,
    evaluate = function(parts, hand)
        return next(parts.mxms_6) and parts.mxms_6 or {}
    end
}
