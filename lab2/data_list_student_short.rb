require_relative 'data_list'
require_relative 'data_table'
require_relative 'StudentShort'
class DataListStudentShort < DataList 
	def initialize(array)
		super
	end
	def get_priva_names()
		return ["Short name", "Contact", "Git"]
	end

	def get_priva_data(obj)
		items = obj.get_info().split("|")[0..-1]
		return items[0..-1]
	end	

	def item_class()
		return StudentShort
	end

end