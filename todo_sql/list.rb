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

    def add
      #should initiate creation of a new task
    end

    # def print_tasks do
    #   @tasks.each do |task|
    #     puts task
    #   end
    # end

  end

end



list = Todo::List.new('todo.db')