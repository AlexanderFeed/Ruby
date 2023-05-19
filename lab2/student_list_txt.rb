require_relative "student.rb"
require_relative "data_list_student_short.rb"

class StudentListTxt
	attr_reader :objects

	def initialize()
		@objects = []
	end

	def read_file(path)
		File.open(path, "r") do |file|
			file.each_line { |x| self.objects.push(Student.init_str(x[0..-2])) }
		end
	end

	def write_file(path)
		File.open(path, "w") do |file|
			self.objects.each { |obj| file.write(obj.get_info_full+"\n") }
		end
	end

	def poluchit_obj(id)
		self.objects.each { |obj|
			if obj.id == id then return obj end
		}
		return nil
	end

	def vstav_obj=(id, object)
		index = 0
		self.objects.each { |obj|
			if obj.id == id then self.objects[index] = object end
			index += 1
		}
	end

	def get_k_n_student_short_list(k, n, input = nil)
		output = []
		(0..n-1).each { |index|
			obj = self.objects[(k*n)+index]
			if obj != nil
				output.push(StudentShort.new_object(obj))
			end
		}
		if input == nil
			return DataListStudentShort.new(output)
		else
			input.array = output
		end
	end

	def sort()
		self.objects.sort_by!(&:get_full_short)
	end

	def add_student(object)
		object.id = self.objects.max_by(&:id).id+1
		self.objects.push(object)
	end

	def remove_student(id)
		self.objects.delete(self.objects.find { |obj|
			obj.id == id
		})
	end

	def replace_student(id, object)
		object.id = id
		self[id] = object
	end

	def get_student_short_count()
		return self.objects.length
	end

end