require 'sqlite3'

module Todo
  @@db = nil
  def self.init(file_path)
    @@db = SQLite3::Database.new file_path
  end
  def self.db
    @@db
  end

#   class sqlqueries
# #    chitat
# #    pisat
#   end

  class List
    def initialize(file_path)
      Todo::init file_path

      @tasks = Todo::db.execute <<-SQL
          SELECT * FROM tasks;
        SQL
# puts 'here are the tasks:'
# puts @tasks.inspect
      # print_tasks
    end


    def add do

      #task being a hash like this: {:description => "feed the elephant", :created_at => "2011-03-23 00:00...", completed_at => etc}

      #retreive priority_id

      #add the descr, created/completed dates & priority_id into tasks table, get the task_id

      #check for existence of tags in tags table, get their id's (if not in the table, add them and get their id's)

      #add task_id and tag_id's to the join table
    end

    # def print_tasks do
    #   @tasks.each do |task|
    #     puts task
    #   end
    # end

  end

end



list = Todo::List.new('todo.db')