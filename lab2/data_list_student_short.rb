require_relative 'data_list'
require_relative 'data_table'
require_relative 'StudentShort'
class DataListStudentShort < DataList 

	def get_priva_names()
		return ["№","Short name", "Git", "Contact"]
	end

	def get_priva_data(obj)
		items = obj.get_info().split("|")[1..-1]
		return items[0..-1]
	end	

end