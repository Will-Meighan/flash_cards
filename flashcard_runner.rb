require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card_3 = Card.new("What planet is furthest from the sun?", "Uranus", :STEM)
@card_4 = Card.new("What is the capital of Djibouti?", "Djibouti", :Geography)

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

    def results
      puts "****** Game Over! ******"
      puts "You had #{@round.number_correct} correct guesses out of #{@round.turns.count} for a total score of #{@round.percent_correct}%."
      puts "Geography - #{@round.percent_correct_by_category(:Geography)}% correct"
      puts "STEM - #{@round.percent_correct_by_category(:STEM)}% correct"
    end
  end

  start
  results



# class Round
#
#   attr_reader :deck, :turns
#
#   def initialize(deck)
#     @deck = deck
#     @turns = []
#   end
#
#   def current_card
#     deck.cards.first
#   end
#
#   def take_turn(guess)
#     @turns << Turn.new(guess, current_card)
#     deck.cards.shift
#     turns.last
#   end
#
#   def correct_answers
#     #need test for helper method
#     turns.find_all do |turn|
#       turn.correct?
#     end
#   end
#
#   def correct_by_category(category)
#     turns.find_all do |turn|
#       turn.card.category == category
#     end
#   end
#
#   def number_correct
#     correct_answers.length
#   end
#
#   def number_correct_by_category
#     correct_by_category.length
#   end
#
#   def percent_correct
#     (correct_answers.length / turns.length.to_f) * 100
#   end
#
#   def percent_correct_by_category
#     (number_correct_by_category(category) / correct_by_category.length.to_f) * 100
#   end
#
# end
