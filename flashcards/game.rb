require './card.rb'

module Flashcard

  class Game

    def initialize(filepath)
      @cards = parse_file(File.readlines('./flashcards.txt'))
      @instructions = "Type study if you want to study cards card.\nType guess if you want to practice.\nType exit if you're done."
      puts @instructions
    end

    def parse_file(card_strings)
      card_strings.map do |card|
        Flashcard::Card.from_string(card)
      end
    end

    def get_card
      @cards[rand(@cards.length)]
    end

    # This wasn't TDD'd.  It's Tony's fault.
    def study(command = nil)
      if command == "stop"
        puts @instructions
        @instructions
      else
        puts "#{ '*' * 50 }\n#{ self.get_card }\n#{"*" * 50 + "\n"}"
        puts "Hit enter to get the next word.\nType stop to return to main menu."
        command = gets.chomp
        study(command)
      end
    end

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
  end # End of the class
end # End of hte module

