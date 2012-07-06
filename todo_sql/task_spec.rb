require 'simplecov'
require 'rspec'
SimpleCov.start
require './task.rb'

include Todo

describe "Task" do

  before (:each) do
    @list = List.new("todo.db")
    @task = Task.new("pet the elephant #personal #fun 5")
  end

    describe ".new(from_string)" do

      it 'initializes as a Task object' do
        @task.should be_an_instance_of Task
      end

      it 'has a description of type string' do
        @task.description.should be_a_kind_of String
      end

      it 'has a created_at attribute of type Time' do
        @task.created_at.should be_a_kind_of Time
      end

      it 'recognizes numbers 1-5 at the end of input as priority' do
        @task.priority.should == 5
      end

      it 'recognizes and separates tags from the input' do
        @task.tags[1].should == '#fun'
      end

    end

    describe 'save' do

      it 'assigns an id to task when saved to db' do
        @task.id.should_not == nil
      end

      it 'can write this task to db'
      # create a mock object to imitate changes in db?

    end

    describe ".new(from_db)" do
      it 'can load a task object from sql response'
    end

    describe "completeness stuff" do

      it "can check if a task is complete"
      it "can mark a task complete"

    end

end

