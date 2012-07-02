require 'rspec'
require 'simplecov'
SimpleCov.start
require './game.rb'

describe Flashcard::Game do
  before :each do
    @new_game = Flashcard::Game.new('flashcards.txt')
    @new_game.stub(:user_input).and_return('study', 'stop')
  end

  it "initializes a game" do
    @new_game.should be_an_instance_of Flashcard::Game
  end

  it "has card objects" do
    @new_game.get_card.should be_an_instance_of Flashcard::Card
  end

  it "can pull random cards" do
    2.times { File.readlines('flashcards.txt').to_s.index(@new_game.get_card.definition).should_not be nil }
    #I think we should prove that the cards aren't equal when we call next_card
  end

  it "can print instructions" do
    instructions = "Type study if you want to study cards card.\nType guess if you want to practice.\nType exit if you're done."
    @new_game.print_instructions.should == instructions
  end

  it "runs in 'study' mode as expected until you type stop" do
    @new_game.study.should equal false
  end

  it 'runs in guess mode until you type stop'
    # @new_game.guess('stop').should == "Type study if you want to study cards card.\nType guess if you want to practice.\nType exit if you're done."



  # it "can confirm a match of a card's definition and a term" do
  #   # card = @new_game.get_card
  #   # card.match_definition(card.term).should equal card.definition
  #   @new_game.get_definition.should be_an_instance_of Object::String
  # end

end
