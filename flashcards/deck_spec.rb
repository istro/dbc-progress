require 'rspec'
require './deck.rb'

describe Flashcard::Deck do
  before :each do
    @deck = Flashcard::Deck.new('flashcards.txt')
  end

  it "initializes a deck" do
    @deck.should be_an_instance_of Flashcard::Deck
  end

  it "has card objects" do
    @deck.next_card.should be_an_instance_of Flashcard::Card
  end

  it "can pull random cards from the deck" do
    2.times { File.readlines('flashcards.txt').to_s.index(@deck.next_card.to_s).should_not be nil }
  end


end