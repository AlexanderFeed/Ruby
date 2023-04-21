require_relative "student.rb"
class StudentShort 
	attr_reader :full_name, :contact

   #инициилизирующая функция
   def initialize(hash)
      	self.full_name = hash[:full_name]
      	self.contact =hash[:contact]
      	super({git:hash[:git]})
   end

   def StudentShort.init_obj(object)
		contact = object.get_contact()
		if contact == nil
			raise ArgumentError.new
		end
		new({full_name:object.get_full_short(), contact:contact, git:object.git})
	end

	private
   def full_name=(some_name) 
    	@full_name = some_name
   end
   def contact=(some_contact) 
    	@contact = some_contact
   end
end