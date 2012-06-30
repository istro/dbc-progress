require './game.rb'

game = Flashcard::Game.new('./flashcards.txt')
command = ""

while command != "exit"
  if command == "study"
    game.study(nil)
  end
  if command == "guess"
    game.guess
  end
  command = gets.chomp
end