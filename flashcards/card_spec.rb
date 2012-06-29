require 'rspec'
require './card.rb'

describe Flashcard::Card do
  before :each do
    @card = Flashcard::Card.new
  end

  it "initializes a card" do
    @card.should be_an_instance_of Flashcard::Card
  end

  [:term, :definition].each do |item|
    it "responds to #{ item }" do
     @card.should respond_to item
    end
  end

  it "can print itself as a string" do
    @card.to_s.should == "#{@name} | #{@definition}"
  end

  it "can create itself from a string" do
    Flashcard::Card.from_string("my name | i do stuff").should be_an_instance_of Flashcard::Card
  end



end