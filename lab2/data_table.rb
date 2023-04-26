class DataTable
	def initialize(matrix)
		@matrix = matrix
	end
	def get_element(row, column)
		return matrix[row][column]
	end

	def columns()
		return self.matrix[0].length
	end

	def rows()
		return self.matrix.length
	end

	private

	attr_reader :matrix
end
