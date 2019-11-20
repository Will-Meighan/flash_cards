class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.shift
    @turns.last
  end

  def number_correct
    @turns.find_all do |turn|
      turn.correct?
    end.length
  end

  def number_correct_by_category(category)
    correct_cards = @turns.find_all do |turn|
      turn.correct?
    end

    correct_cards.find_all do |turn|
      turn.card.category == category
    end.length
  end


end
