require_relative "file_operator"
require_relative "student"

class FileOperatorTxt < FileOperator

	def read_file(path)
		objects = []
		File.open(path, "r") do |file|
			file.each_line { |x| objects.push(Student.new_string(x[0..-1])) }
		end
		return objects
	end

	def write_file(path, objects)
		File.open(path, "w") do |file|
			objects.each { |obj| file.write(obj.get_info_full+"\n") }
		end
	end

	def get_info_full
      info = "#{self.id}|#{self.first_name}|#{self.sur_name}|#{self.last_name}|#{self.phone}|#{self.mail}|#{self.tg}|#{self.git}"
      return info
   end

end