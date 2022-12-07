require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true 
    end
end


class User

    attr_accessor :fname, :lname

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| User.new(datum) }
    end

    def self.find_my_id()

    end

    def self.find_my_name(fname, lname)
        # name = QuestionsDatabase.instance.execute(<<-SQL, )
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    

end



class Question

    def self.find_my_id
        
    end

end


class QuestionFollow

    def self.find_my_id
        
    end

end



class Reply

    def self.find_my_id
        
    end

end


class QuestionLike

    def self.find_my_id
        
    end

end


