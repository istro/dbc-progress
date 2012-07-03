require './game.rb'

# game = Flashcard::Game.new('./flashcards.txt')
game = Flashcard::Game.new('./tab_delimited_flashcards-38-terms.txt')
command = ""

while command != "exit"
  puts game.instructions
  command = gets.chomp

  case command
  when "study"
    puts game.study_instructions
    game.study_game
  when "guess"
    puts game.guess_instructions
    game.guess_game
  end
end