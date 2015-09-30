loop do
  @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
  player_throw = gets.chomp.to_sym
  p player_throw
  if !@throws.include?(player_throw)
    p "wrong type"
  end
end
