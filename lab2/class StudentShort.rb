require_relative "student.rb"
class StudentShort < Student
	attr_reader :id :full_name,:git,:contact

   #инициилизирующая функция
   def initialize(hash)
      	self.id = hash[:id]
      	self.full_name = hash[:full_name]
      	self.git = hash[:git]
      	self.contact =hash[:contact]
   end

   def StudentShort.init_obj(object)
		self.id = object.id
		self.full_name = object.get_full_short()
		self.git = object.git
		contact = object.get_contact()
		if contact != nil
			self.contact=contact
		end
	end

	def id=(some_id) 
    	@id = some_id
   end
   def full_name=(some_name) 
    	@full_name = some_name
   end
   def git=(some_git) 
    	@git = some_git
   end
   def contact=(some_contact) 
    	@contact = some_contact
   end
end