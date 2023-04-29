class DataList 

	def initialize(array)
		@array = array
		@mark = []
	end

	def array=(some_array) 
    	@array = some_array
   end


	def select(number)
		self.mark.append(self.array[number])
	end

	def get_selected()
		return self.mark
	end

	def get_names()
		return ["№"] + get_priva_names()
	end

	def get_data()
		matrix = []
		index = 0
		self.array.each { |item|
			matrix.push( [index] + item.get_info().split('|')[1..-1] )
			index += 1
		}
		return DataTable.new(matrix)
	end

	private

	def get_priva_names()
		return []
	end

	def get_priva_data()
		return []
	end	
	



	private
	attr_reader :array
end