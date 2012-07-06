require 'simplecov'
require 'rspec'
SimpleCov.start
require './list.rb'

include Todo
  describe "List" do
    before(:each) do
      @list = List.new("todo.db")
    end

  describe ".new" do
    it "returns an instance of List" do
      @list.should be_an_instance_of List
    end

    it "contains an array of tasks" do
      @list.tasks.should be_an_instance_of Array
    end

  end


end
