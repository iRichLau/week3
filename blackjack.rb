class Blackjack
  attr_accessor :player, :dealer

  def initialize
    @player = Player.new
    @dealer = Dealer.new
  end

  def deck_of_card
    @deck_of_card = [1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10].shuffle
  end

  def deal_hands
    2.times do
      player.hand << deck_of_card.pop
      dealer.hand << deck_of_card.pop
    end
  end

  def ask_to_hit
    if player.hit?
      player.hand << deck_of_card.pop
      puts "Okay. Now you have #{player.point_total}"
    else
      puts "You stayed at #{player.point_total}, now it's the dealers turn"
    end
  end

  def play_game
    deal_hands
    puts "You have #{player.point_total} and the dealer has #{dealer.point_total}"
    ask_to_hit
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

  def hit?
    puts "Do you want to hit?(y/n)"
    answer = gets.chomp
    while (answer != "n" and answer != "y") do
      puts "Sorry you can only reply with y or n. Please try again!"
      answer = gets.chomp
    end
    answer == 'y' ? true : false
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
end


blackjack = Blackjack.new
blackjack.play_game
