module Flashcard
  class Card
    attr_reader :term, :definition

    def initialize(term, definition)
      @term = term
      @definition = definition
    end

    def self.from_string(string)
      term, definition = string.split("\t").collect(&:chomp)
      Flashcard::Card.new(term, definition)
    end

    def to_s
      "#@term\t#@definition"
    end

    def match_term?(term)
      @term == term
    end

  end
end