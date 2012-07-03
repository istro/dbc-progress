require './card.rb'

module Flashcard

  class Game

    def initialize(filepath)
      @cards = parse_file(File.readlines('./flashcards.txt'))
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

    def study
      puts get_card.to_s
      continue_game(:study)
    end

    def card_to_guess
      @card_to_guess = get_card
    end

    def guess(term = nil)
      if term.nil?
        card_to_guess
        @counter = 1
        puts @card_to_guess.definition
        continue_game(:guess)
      else
        if @card_to_guess.match_term?(term.to_s)
          puts "Correct! Now, try this one:"
          guess(nil)
        else
          if @counter < 3
            puts "Wrong, please try again!"
            @counter += 1
            continue_game(:guess)
          else
            puts "Nice try.  Here's what you were looking for: #{@card_to_guess.term}"
            guess(nil)
          end
        end
      end
    end

    def continue_game(method)
      command = user_input

      if command == :stop
        # puts print_instructions
        return false
      else
        case method
          when :study
            study
          when :guess
            guess(command)
        end
      end
    end

    def user_input
      gets.chomp.to_sym
    end

  end # End of the class
end # End of the module