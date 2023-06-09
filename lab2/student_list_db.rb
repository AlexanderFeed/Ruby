require_relative "student"
require_relative "StudentShort"
require_relative "data_list_student_short"
require_relative "db_operator"
require "sqlite3"

class StudentListDB

	private

	def initialize()
	end


	public

	def [](id)
		return Student.new_hash(DBOperator.instance.get_element("Student", id))
	end

	def get_k_n_student_short_list(k, n, input = nil)
		result = DBOperator.instance.get_k_n_elements("Student", k, n)
		output = []
		result.each { |student|
			#puts row
			output.push(StudentShort.new_object(Student.new_hash(student)))
		}
		if input == nil
			return DataListStudentShort.new(output)
		else
			input.array = output
		end
	end

	def add_student(object)
		hash = object.to_hash()
		p hash
		hash.delete(:id.to_s)
		p hash
		DBOperator.instance.add_element("Student", hash)	
	end

	def remove_student(id)
		DBOperator.instance.remove_element("Student", id)
	end

	def replace_student(id, object)
		hash = object.to_hash()
		hash.delete(:id.to_s)
		DBOperator.instance.replace_element("Student", id, hash)
	end

	def get_count()
		
		return DBOperator.instance.get_count("Student")
	end
end