require 'rspec'
require 'simplecov'
SimpleCov.start
require './card.rb'

describe Flashcard::Card do
  before :each do
    @term = "a" * rand(24)
    @definition = "b" * rand(15)
    @card = Flashcard::Card.new(@term, @definition)
  end

  it "initializes a card" do
    @card.should be_an_instance_of Flashcard::Card
  end

  [:term, :definition].each do |item|
    it "responds to #{ item }" do
     @card.should respond_to item
    end
  end

  it "has a term" do
    @card.term.should equal @term
  end

  it "has a definition" do
    @card.definition.should equal @definition
  end

  it "can print itself as a string" do
    @card.to_s.should == @card.term + "\t" + @card.definition
  end

  it "can create itself from a string" do
    Flashcard::Card.from_string("my name\ti do stuff").should be_an_instance_of Flashcard::Card
  end

  it "can confirm a term matches its definition" do
    random_string = ""
    10.times{ random_string << (65 + rand(50)).chr }
    @card.match_term?(@card.term).should equal true
    @card.match_term?(random_string).should equal false
  end

end