def add_deck(deck)
  ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'].each do |idx|
    deck << [idx, 'Diamonds']
    deck << [idx, 'Spades']
    deck << [idx, 'Clubs']
    deck << [idx, 'Hearts']
  end
end

def show_hand(hand, player)
  puts "Here is #{player}'s current hand:"
  hand.each do |card|
    puts card[0].to_s + ' of ' + card[1].to_s
  end
end

def best_value(hand)
  sum = 0
  aces = 0
  hand.each do |card|
    value = 0
    if card[0] == 'A'
      value = 11
      aces += 1
    elsif card[0] == 'J' || card[0] == 'Q' || card[0] == 'K'
      value = 10
    else
      value = card[0].to_i
    end
    sum += value
  end

  while sum > 21 and aces > 0
    sum -= 10
    aces -= 1
  end

  sum
end

puts "Hello, what's your name?"
name = gets.chomp

puts "Hello #{name}, let's play some Blackjack.  How many decks would you like to use?"
deck_count = gets.chomp.to_i

deck = []
deck_count.times {add_deck(deck)}

puts "OK, we are using #{deck_count.to_s} decks. Would you like to shuffle the deck(s) each game? (y/n)"
shuffle_each_game = gets.chomp

puts "Alright! Let's play."

keep_playing = 'y'
game_deck = deck.shuffle

while keep_playing == 'y'
  if shuffle_each_game.downcase == 'y'
    game_deck = deck.shuffle #start with complete fresh deck
  end

  player = []
  dealer = []
  2.times do 
    player << game_deck.pop
    dealer << game_deck.pop
  end

  if best_value(player) == 21 
    show_hand(player, name)
    if best_value(dealer) == 21
      puts "Dealer and #{name} both got Blackjacks, it's a push."
      show_hand(dealer, 'the dealer')
    else
      puts "Blackjack! You win!"
    end
    puts "Would you like to play another game? (y/n)"
    keep_playing = gets.chomp.downcase
    next
  elsif best_value(dealer) == 21
    puts "Dealer Blackjack, you lose!"
    show_hand(dealer, 'the dealer')    
    puts "Would you like to play another game? (y/n)"
    keep_playing = gets.chomp.downcase
    next
  end 

  player_bust = false
  player_turn = true
  player_value = 0

  while player_turn
    show_hand(player, name)
    player_value = best_value(player)
    if  player_value > 21
      player_bust = true
      break
    end

    puts "Would you like to (h)it or (s)tay?"
    cont = gets.chomp
    if cont == 's'
      puts "OK, you are staying with a hand value of #{player_value}"
      player_turn = false
    else
      puts "Hit!"
      player << game_deck.pop
    end
  end

  if player_bust
    puts "I'm sorry, you busted. Would you like to play another game? (y/n)"
    keep_playing = gets.chomp.downcase
    next
  end

  dealer_bust = false
  dealer_turn = true
  dealer_value = 0

  while dealer_turn
    show_hand(dealer, 'the dealer')
    dealer_value = best_value(dealer)
    if  dealer_value > 21
      dealer_bust = true
      break
    elsif dealer_value < 17
      puts "Dealer hits"
      dealer << game_deck.pop
    else
      puts "Dealer stays"
      dealer_turn = false
    end
  end

  if dealer_bust
    puts "Dealer busted, you win!"
  elsif player_value > dealer_value
    puts "Congratulations, you beat the dealer!"
  elsif player_value == dealer_value
    puts "Push - you tied with the dealer."
  else
    puts "I'm sorry, you have lost to the dealer."
  end

  puts "Would you like to play another game? (y/n)"
  keep_playing = gets.chomp.downcase
end

