require './list.rb'

module Todo
  class Task
    attr_reader :description, :created_at, :priority, :tags, :id
    attr_accessor :completed_at
    def initialize(input)
      if input.class == String
        from_string(input)
      end

    end

    def from_string(string)
      @created_at = Time.now
      @priority = nil
      @id = nil

      #check if priority is given, capture it
      if string.match(/\s[1-5]$/g)
        @priority = $1.to_i
      end

      #check if there are tags given, separate them from description
      @tags = string.scan(/#\w+/)

      @description = string.gsub(/#\w+/, '').strip
    end

    def from_db(array)

      # sql select tasks gives us an array of rows, each of which is an array like: [id, desc, created, completed, priority]
      # sql select tags gives us an array of rows, each like [id, tag]
      # sql select tags_tasks gives us an array of rows, each like [id, tag_id, task_id]

    end

  end # class end
end # module end


my_task = Todo::Task.new('my task #personal 5')
puts my_task.inspect
my_task2 = Todo::Task.new('my second task without priority but with #two #three #tags')
puts my_task2.inspect

