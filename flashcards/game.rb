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

    def print_instructions
      "Type study if you want to study cards card.\nType guess if you want to practice.\nType exit if you're done."
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
        puts @card_to_guess.definition
        continue_game(:guess)
      else
        puts @card_to_guess.match_term?(term.to_s) ? "Correct" : "Wrong"
        continue_game(:guess)
      end
    end

    def continue_game(method)
      command = user_input

      if command == :stop
#       puts print_instructions
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
end # End of hte module


















































=begin

# This wasn't TDD'd.  It's totally Tony's fault.
def guess(command = nil)
  if command == "stop"
    puts "We're stopping now."
    return true
  end
  card = self.get_card
  puts "#{ '*' * 50 }\n#{ card.definition }\n#{"*" * 50 + "\n"}"
  puts "What is the term that matches this definition?"
  result = match_card(card)
  if result == "stop"
    puts @instructions
    return
  end
  if result == "correct"
    puts "Well, you guessed it this time... next one will be harder!"
    guess(command)
  else
    puts "You'll get it next time, homie.  Here's the word #{ card.term }."
    guess(command)
  end
end

# This wasn't TDD'd.  Guess who's fault?
def match_card(card)
  command = ""
  count = 0
  result = "none"
  while !card.match_term?(command) && count < 3
    command = gets.chomp
    if command == "stop"
      result = "stop"
      break
    elsif card.match_term?(command)
      result = "correct"
    else
      puts "Ha! You'll never guess it!"
      count += 1
    end
  end
  result
end

=end