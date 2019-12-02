require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card_3 = Card.new("What planet is furthest from the sun?", "Uranus", :STEM)
@card_4 = Card.new("What is the capital of Djibouti?", "Djibouti", :Geography)
@card_5 = Card.new("Is Fairfield cool?", "Eh...", :Geography)

@deck = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5])

@round = Round.new(@deck)

def start
  puts "Welcome! You're playing with #{@deck.count} cards."
  puts "-" * 50
  until @round.turns.count == 5
    puts "This is card number #{@round.turns.count + 1} out of 4."
    puts "Question: #{@round.current_card.question}"
    print "> "
    answer = gets.chomp.capitalize
    @round.take_turn(answer)

    if @round.turns.last.correct?
      puts "#{@round.turns.last.feedback}"
    else
      puts "#{@round.turns.last.feedback} The correct answer is: #{@round.turns.last.card.answer}"
    end
  end
end

def results
  puts "****** Game Over! ******"
  puts "You had #{@round.number_correct} correct guesses out of #{@round.turns.count} for a total score of #{@round.percent_correct}%."
  puts "Geography - #{@round.percent_correct_by_category(:Geography)}% correct"
  puts "STEM - #{@round.percent_correct_by_category(:STEM)}% correct"
end

start
results
