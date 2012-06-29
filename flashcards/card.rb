module Flashcard
  class Card
    attr_reader :term, :definition

    def initialize(term, definition)
      @term = term
      @definition = definition
    end

    def self.from_string(string)
      term = string.split(" | ")[0].chomp
      definition = string.split(" | ")[1].chomp
      Flashcard::Card.new(term, definition)
    end

    def to_s
      "#@term | #@definition"
    end

  end
end