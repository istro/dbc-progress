require './deck.rb'
require './card.rb'

deck = Flashcard::Deck.new('./flashcards.txt')

variable = ""
puts "Type study if you want to study cards card.\nType guess if you want to practice.\nType exit if you're done."

while variable != "exit"
  if variable == "study"
    puts "*" * 50
    puts deck.next_card
    puts "*" * 50 + "\n"
  elsif variable == "guess"
    # Do stuff
  end
  variable = STDIN.readline.chomp
end
