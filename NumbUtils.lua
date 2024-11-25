
local evaluate_poker_hand_ref = evaluate_poker_hand
function evaluate_poker_hand(hand)
  local results = evaluate_poker_hand_ref(hand)
  for k, v in pairs(G.jokers.cards) do
    change_acting(v)
  end
  results = evaluate_poker_hand_ref(hand)
  for k, v in pairs(G.jokers.cards) do
    change_acting(v)
  end
  return results
end

function change_acting(joker)
  if joker.ability.is_actually then
    joker.ability.name = joker.ability.is_actually
    joker.is_actually = nil
  elseif joker.acts_as and type(joker.acts_as) == "string" then
    joker.ability.is_actually = joker.ability.name
    joker.ability.name = joker.ability.acts_as
  end
end