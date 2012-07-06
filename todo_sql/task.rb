module Todo
  class Task
    attr_reader :description, :created_at, :priority, :tags
    attr_accessor :completed_at
    def initialize(input)
      if input.class == String
        from_string(input)
      end

    end

    def from_string(string)
      @created_at = Time.now

      # if string.match(/\s[1-5]$/g)
      #   @priority = $1.to_i

      #check if priority is given, capture it
      if string[string.length-2] == ' ' && string[string.length-1].match(/1|2|3|4|5/)
        @priority = string[string.length-1].to_i
        string.slice!(-2..-1)
      else
        @priority = nil
      end

      @tags = []
      #check if there are tags given, separate them from description
      # string.scan(/#\w+/)
      if string.match(/#/)
        arr = string.split(' ')
        arr.each do |word|
          if word[0] == '#'
            @tags << word
          end
        end
        string.slice!(string.index('#')-1..-1)
      end
      @description = string
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

