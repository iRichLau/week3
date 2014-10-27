class Blackjack
  attr_accessor :player, :dealer

  def initialize
    @player = Player.new
    @dealer = Dealer.new
  end

  def deck_of_card
    @deck_of_card = (([1,2,3,4,5,6,7,8,9] * 4) + ([10] * 16)).shuffle
  end

  def deal_hands #deals two cards each to player and dealer
    2.times do
      player.hand << deck_of_card.pop
      dealer.hand << deck_of_card.pop
    end
  end

  def bust?(player_or_dealer) #checks if player or dealer busted. pass in either a player or dealer
    player_or_dealer.point_total > 21 ? true : false
  end

  def ask_to_hit #requires interaction to determine if player should hit
      while (player.hit?) do
        player.hand << deck_of_card.pop
        if bust?(player)
          puts "Sorry you busted with #{player.point_total}. You lose!"
          break
        else
          puts "Okay. Now you have #{player.point_total}."
        end
      end
  end

  def determine_winner
    if !bust?(dealer) # checks if the dealer did not bust
      if player.point_total > dealer.point_total then puts "#{player.name}, you win with #{player.point_total}" end
      if player.point_total < dealer.point_total then puts "Sorry #{player.name}, you lose. The dealer beat you by #{dealer.point_total - player.point_total}." end
      if player.point_total == dealer.point_total then puts "It's a draw. Nobody wins!" end
    else
      puts "Dealer bust! #{player.name}, You win!"
    end
  end

  def dealer_play # dealer logic for determining if it should hit
    puts "You stayed at #{player.point_total}, now it's the dealers turn."
    while (dealer.hit?) do #checks to see if dealer should/continue to hit
      dealer.hand << deck_of_card.pop
    end
     puts "The dealer has #{dealer.point_total}."
      determine_winner
  end

  def play_game
    deal_hands
    puts "You have #{player.point_total} and the dealer's top card is #{dealer.hand[0]}"
    ask_to_hit
    dealer_play unless bust?(player) #if the player bust then it the dealer is not required to play
  end
end


class Player
  attr_reader :name
  attr_accessor :hand

  def initialize
    puts "What is your name?"
    @name = gets.chomp
    @hand = []
  end

  def point_total
    sum = 0
    hand.each do |card|
      sum += card
    end
    sum
  end

  def hit? #determines if player decides to hit. returns true or false. makes sure only y or n are allowed as user input
    puts "Do you want to hit?(y/n)"
    answer = gets.chomp
    while (answer != "n" and answer != "y") do
      puts "Sorry you can only reply with y or n. Please try again!"
      answer = gets.chomp
    end
    answer == 'y' ? true : false # if answer is equal to y it's true else it's false
  end
end


class Dealer
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def point_total
    sum = 0
    hand.each do |card|
      sum += card
    end
    sum
  end

  def hit?
    point_total < 17 ? true : false
  end
end

blackjack = Blackjack.new
blackjack.play_game
