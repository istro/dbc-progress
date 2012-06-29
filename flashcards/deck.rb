require './card.rb'

module Flashcard

  class Deck

    def initialize(filepath)
      @cards = parse_file(File.readlines('./flashcards.txt'))
    end

    def parse_file(card_strings)
      card_strings.map do |card|
        Flashcard::Card.from_string(card)
      end
    end

    def next_card
      @cards[rand(@cards.length)]
    end


  end

end