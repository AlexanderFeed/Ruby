
class DBOperator

	private attr_reader :connection

	private

	def initialize()

	end

	private_class_method :new

    public

    def get_element(table, id)
        return self.connection.query("SELECT * FROM #{table} WHERE ID=#{id}").next.transform_keys(&:to_sym)
    end

    def get_k_n_elements(table, k, n)
		result = self.connection.query("SELECT * FROM #{table} LIMIT #{k*n},#{n}")
		output = []
		result.each { |row|
			#puts row
			output.push(row.transform_keys(&:to_sym))
		}
		return output
	end

    def add_element(table, hash)
		fields = "#{hash.keys[0]}"
		(1..hash.keys.length-1).each { |index|
			fields += ", #{hash.keys[index]}"
		}

		values = "'#{hash.values[0]}'"
		(1..hash.values.length-1).each { |index|
			values += ", '#{hash.values[index]}'"
		}

        self.connection.execute("INSERT INTO #{table} (#{fields})
		VALUES (#{values})")
	end

    def remove_element(table, id)
		self.connection.execute("DELETE FROM #{table} WHERE id=#{id}")
	end

    def replace_element(table, id, hash)
		fields = "#{hash.keys[0]}='#{hash.values[0]}'"
		(1..hash.keys.length-1).each { |index|
			fields += ", #{hash.keys[index]}='#{hash.values[index]}'"
		}

		self.connection.execute("UPDATE #{table} SET #{fields}
		WHERE id=#{id}")
	end

    def get_count(table)
		return self.connection.query("SELECT COUNT(*) FROM #{table}").next["COUNT(*)"]
	end

    def connect(database)
		@connection = SQLite3::Database.open(database)
		@connection.results_as_hash = true
	end


	public


	@instance = new
	def self.instance
		@instance
	end

	def self.connect(database)
		self.instance.connect(database)
	end
end