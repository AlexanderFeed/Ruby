require_relative "student"
require_relative "BaseStudent"
class StudentShort < BaseStudent
	public attr_accessor :full_name, :contact
	
   #инициилизирующая функция
   def initialize(hash)
      	self.full_name = hash[:full_name]
      	self.contact = hash[:contact]
      	super({id:hash[:id], git:hash[:git]})
   end

   def StudentShort.init_obj(object)
		contact = object.get_contact()
		if contact == nil
			raise ArgumentError.new
		end
		new({id:object.id, full_name:object.get_full_short(), contact:contact, git:object.git})
	end



end