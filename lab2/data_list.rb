class DataList 

	def initialize(array)
		@array = array
		@mark = []
	end

	def select(number)
		self.mark.append(self.array[number])
	end

	def get_selected()
		return self.mark
	end

	def get_names()

	end

	def get_data()
	end

	private
	attr_reader :array
end