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
    turns << Turn.new(guess, current_card)
    deck.cards.shift
    turns.last
  end

  def number_correct
    turns.find_all do |turn|
      turn.correct?
    end.length
  end

  def number_correct_by_category(cat)
    correct_cards = turns.find_all do |turn|
      turn.correct?
    end

    correct_cards.find_all do |turn|
      turn.card.category == cat
    end.length
  end

  def percent_correct
    correct_cards = turns.find_all do |turn|
      turn.correct?
    end

    (correct_cards.length / turns.length.to_f.round(2)) * 100
  end

  def percent_correct_by_category(category)
    turns_by_category = turns.find_all do |turn|
      turn.card.category == category
    end

    correct_turns_by_category = number_correct_by_category(category)

    if correct_turns_by_category == 0
      0.0
    else
      percent_cor_by_cat = (correct_turns_by_category / turns_by_category.length.to_f.round) * 100
    end
  end

end
