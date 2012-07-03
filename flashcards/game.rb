require './card.rb'

module Flashcard

  class Game

    def initialize(filepath)
      @cards = parse_file(File.readlines(filepath))
    end

    def parse_file(card_strings)
      card_strings.map do |card|
        Flashcard::Card.from_string(card)
      end
    end

    def get_card
      @cards[rand(@cards.length)]
    end

    def instructions
      "Type study if you want to study cards card.\nType guess if you want to practice.\nType exit if you're done."
    end

    def study_instructions
      "Hit enter to get another term / definition combination.\nType 'stop' and hit enter to exit study mode."
    end

    def guess_instructions
      "Type the term that matches the definition and hit enter.\nType 'stop' and hit enter to exit study mode."
    end

    def study_game
      keep_playing do
        puts get_card.to_s
      end
      false
    end

    def keep_playing
      command = user_input
      while command != :stop
        yield(command)
        command = user_input
      end
    end

    def guess_game
      new_guess_card
      keep_playing do |this_guess|
        guess(this_guess)
      end
      false
    end

    def new_guess_card
      @card_to_guess = get_card
      @counter = 1
      puts @card_to_guess.definition
    end

    def guess(term)
      if @card_to_guess.match_term?(term.to_s)
        puts "Correct! Now, try this one:"
        new_guess_card
      elsif @counter < 3
        puts "Wrong, please try again!"
        @counter += 1
      else
        puts "Nice try.  Here's what you were looking for: #{@card_to_guess.term}"
        new_guess_card
      end
    end

    def user_input
      gets.chomp.to_sym
    end

  end # End of the class
end # End of the module