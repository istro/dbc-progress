require './game.rb'

game = Flashcard::Game.new('./flashcards.txt')
command = ""

while command != "exit"
  puts game.instructions
  command = gets.chomp

  if command == "study"
    puts game.study_instructions
    game.study
  end
  if command == "guess"
    puts game.guess_instructions
    game.guess(nil)
  end
end