require_relative "student"
require_relative "StudentShort"
require_relative "data_list_student_short"
require_relative "db_operator"
require "sqlite3"

class StudentsListDB

	private

	def initialize()
	end


	public

	def [](id)
		return DBOperator.instance.get_student(id)
	end

	def get_k_n_student_short_list(k, n, input = nil)
		result = DBOperator.instance.get_k_n_students(k,n)
		output = []
		result.each { |student|
			#puts row
			output.push(StudentShort.new_object(student))
		}
		if input == nil
			return DataListStudentShort.new(output)
		else
			input.array = output
		end
	end

	def add_student(object)
		DBOperator.instance.add_student(object)
	end

	def remove_student(id)
		DBOperator.instance.remove_student(id)
	end

	def replace_student(id, object)
		DBOperator.instance.replace_student(id, object)
	end

	def get_count()
		return DBOperator.instance.get_count()
	end
end