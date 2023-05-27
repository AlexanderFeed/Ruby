require_relative "student"
require_relative "BaseStudent"
class StudentShort < BaseStudent
	public attr_accessor :full_name, :contact
	
   #инициилизирующая функция
   private
   def initialize(hash)
      	self.full_name = hash[:full_name]
      	self.contact = hash[:contact]
      	super({id:hash[:id], git:hash[:git]})
   end

   def StudentShort.new_object(object)
		contact = object.get_contact()
		if contact == nil then contact = {type:nil, contact:nil} end
		if contact == nil
			raise ArgumentError.new
		end
		new({id:object.id, full_name:object.get_full_short(), contact:contact, git:object.git})
	end

	def self.new_string(new_id, string)
		splitted = string.split('|')
		contact_splitted = splitted[2].split(':')
		return new({id:new_id, short_name:splitted[0], git:splitted[1], contact_type:contact_splitted[0], contact:contact_splitted[1]})
	end
	
	public
	
	def get_info
		info = super()
		info += "|#{self.short_name}|"
		info += "#{self.git}|"
		contact = get_one_contact()
		if contact != nil
			info += "#{contact[:type]}:#{contact[:contact]}"
		end
		return info
	end
	
	### OBJECT PRIVATE METHODS
	private :set_contacts, :git=, :id=
	
	private
	
	def short_name=(new_short_name)
		@short_name = new_short_name
	end
	
	def set_contact_by_name(name, contact)
		case name
			when "phone"
				set_contacts(phone:contact, tg:"", mail:"")
			when "tg"
				set_contacts(tg:contact, phone:"", mail:"")
			when "mail"
				set_contacts(mail:contact, tg:"", phone:"")
		end
	end
end
