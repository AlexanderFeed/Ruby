require_relative "student_list_db.rb"

class StudentsList
    ### GENERATED
    public attr_accessor :list
	### INITIALIZE
	private

	def initialize(list)
		self.list = list
	end

	### PUBLIC OBJECT METHODS
	public

	def [](id)
		return self.list[id]
	end

	def get_k_n_student_short_list(k, n, input = nil)
		self.list.get_k_n_student_short_list(k,n,input)
	end

	def add_student(object)
		self.list.add_student(object)
	end

	def remove_student(id)
		self.list.remove_student(id)
	end

	def replace_student(id, object)
		self.list.replace_student(id, object)
	end

	def get_count()
		self.list.get_count()
	end

end