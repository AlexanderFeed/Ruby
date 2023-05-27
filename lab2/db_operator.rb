require_relative "student"
class DBOperator

	private attr_reader :connection

	private

	def initialize()

	end

	private_class_method :new

    public

    def get_student(id)
        return Student.new_hash(self.connection.query("SELECT * FROM Student WHERE ID=#{id}").next.transform_keys(&:to_sym))
    end

    def get_k_n_students(k, n)
		result = self.connection.query("SELECT * FROM Student LIMIT #{k*n},#{n}")
		output = []
		result.each { |row|
			#puts row
			output.push(Student.new_hash(row.transform_keys(&:to_sym)))
		}
		return output
	end

    def add_student(object)
        self.connection.execute("INSERT INTO Student (first_name, sur_name, last_name, git, phone, tg, mail)
		VALUES ('#{object.first_name}', '#{object.sur_name}', '#{object.last_name}', '#{object.git}', '#{object.phone}', '#{object.tg}', '#{object.mail}')")
	end

    def remove_student(id)
		self.connection.execute("DELETE FROM Student WHERE id=#{id}")
	end

    def replace_student(id, object)
		self.connection.execute("UPDATE Student SET first_name='#{object.first_name}', sur_name='#{object.sur_name}', last_name='#{object.last_name}',
			git='#{object.git}', phone='#{object.phone}', tg='#{object.tg}', mail='#{object.mail}'
			WHERE id=#{id}")
	end

    def get_count()
		return self.connection.query("SELECT COUNT(*) FROM Student").next["COUNT(*)"]
	end

    def connect(database)
		@connection = SQLite3::Database.open(database)
		@connection.results_as_hash = true
	end


	public

	def self.instance
		if @instance == nil
			@instance = new()
		end
		return @instance
	end

	def self.connect(database)
		self.instance.connect(database)
	end
end