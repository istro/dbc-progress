require 'rspec'
require 'simplecov'
SimpleCov.start
require './game.rb'

describe Flashcard::Game do
  before :each do
    @game = Flashcard::Game.new('flashcards.txt')
    @instructions = "Type study if you want to study cards card.\nType guess if you want to practice.\nType exit if you're done."
    @study_instructions = "Hit enter to get another term / definition combination.\nType 'stop' and hit enter to exit study mode."
    @guess_instructions = "Type the term that matches the definition and hit enter.\nType 'stop' and hit enter to exit study mode."
  end

  it "initializes a game" do
    @game.should be_an_instance_of Flashcard::Game
  end

  it "has card objects" do
    @game.get_card.should be_an_instance_of Flashcard::Card
  end

  it "can pull random cards" do
    2.times { File.readlines('flashcards.txt').to_s.index(@game.get_card.definition).should_not be nil }
  end

  it "can print instructions" do
    @game.instructions.should == @instructions
  end

  it "can print study instructions" do
    @game.study_instructions.should == @study_instructions
  end

  it "can print guess instructions" do
    @game.guess_instructions.should == @guess_instructions
  end

  it "runs in 'study' mode as expected until you type stop" do
    @game.stub(:user_input).and_return(:study, :stop)
    @game.study_game.should equal false
  end

  it 'enters guess mode until you type stop' do
    @game.stub(:get_card).and_return(Flashcard::Card.new('term', 'definition'))
    @game.stub(:user_input).and_return(:anything, :stop)
    #@game.game_mode = :guess
    #@game.new_guess_card.should equal false
    #@game.new_guess_card.should equal false
    @game.guess_game.should be_false
  end

  it 'correctly matches a card in guess mode' do
    STDOUT.should_receive(:puts).with("definition")
    STDOUT.should_receive(:puts).with("Wrong, please try again!")
    STDOUT.should_receive(:puts).with("Correct! Now, try this one:")
    STDOUT.should_receive(:puts).with("definition")
    @game.stub(:get_card).and_return(Flashcard::Card.new('term', 'definition'))
    @game.stub(:user_input).and_return(:anything, :term, :stop)
    #@game.game_mode = :guess
    @game.guess_game
  end

  it 'only lets you guess 3 times before revealing the answer' do
    STDOUT.should_receive(:puts).with("definition")
    2.times { STDOUT.should_receive(:puts).with("Wrong, please try again!") }
    STDOUT.should_receive(:puts).with("Nice try.  Here's what you were looking for: term")
    STDOUT.should_receive(:puts).with("definition")
    @game.stub(:get_card).and_return(Flashcard::Card.new('term', 'definition'))
    @game.stub(:user_input).and_return(:anything, :anything_else, :anything_else_again, :stop)
    #@game.game_mode = :guess
    @game.guess_game
  end

end
