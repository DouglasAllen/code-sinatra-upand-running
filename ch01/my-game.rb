loop do
  @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
  computer_throw = @throws.sample
  player_throw = gets.chomp.to_sym
  p player_throw
  if !@throws.include?(player_throw)
    p "wrong type"
  end
  
  if player_throw == computer_throw
    p "You tied with the computer. Try again!"
  elsif computer_throw == @defeat[player_throw]
    p "Nicely done; #{player_throw} beats #{computer_throw}!"
  else
    p "Ouch; #{computer_throw} beats #{player_throw}. Better luck next time!"
  end
end
