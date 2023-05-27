require_relative "BaseStudent"

class Student < BaseStudent
   ### GENERATED
   public attr_reader :first_name, :sur_name, :last_name
   
   ### INITIALIZE
   private
   
   def initialize(hash)
      #first_name, sur_name and last_name are necessary, others optional
      if(hash[:first_name] == nil or hash[:sur_name] == nil or hash[:last_name] == nil)
         raise ArgumentError.new "first_name, sur_name and last_name are necessary for constructor."
      end
      set_first_name({first_name:hash[:first_name], sur_name:hash[:sur_name], last_name:hash[:last_name]})
      super({id:hash[:id], git:hash[:git], phone_number:hash[:phone_number], email:hash[:email], telegram:hash[:telegram]})
   end
   
   ### CONSTRUCTOR METHODS
   public
   
   def self.new_string(string)
      splitted = string.split('|', -1)
      if splitted.length != 8 # we need all 8 fields, even if it empty
         raise ArgumentError.new "Wrong string format for constructor."
      end
      return new({id:splitted[0], first_name:splitted[1], sur_name:splitted[2], last_name:splitted[3], phone_number:splitted[4], email:splitted[5], telegram:splitted[6], git:splitted[7]})
   end
   
   ### OBJECT PUBLIC METHODS
   public
   
   def set_first_name(hash)
      if hash[:first_name] != nil 
         if hash[:first_name].match(/^[a-zA-Zа-яА-Я]+$/)
            @first_name = hash[:first_name].capitalize
         else
            raise ArgumentError.new "Wrong first_name."
         end
      end
      if hash[:sur_name] != nil #if we not input sur_name, not change this
         if hash[:sur_name].match(/^[a-zA-Zа-яА-Я]+$/)
            @sur_name = hash[:sur_name].capitalize
         else
            raise ArgumentError.new "Wrong sur_name."
         end
      end
      if hash[:last_name] != nil #if we not input last_name, not change this
         if hash[:last_name].match(/^[a-zA-Zа-яА-Я]+$/)
            @last_name = hash[:last_name].capitalize
         else
            raise ArgumentError.new "Wrong last_name."
         end
      end
   end
   
   def get_family_and_initials
      return "#{self.sur_name} #{self.first_name[0]}.#{self.last_name[0]}."
   end
   
   def get_info_full
      info = "#{self.id}|#{self.first_name}|#{self.sur_name}|#{self.last_name}|#{self.phone}|#{self.mail}|#{self.tg}|#{self.git}"
      return info
   end
   
   def get_info
      info = "|#{get_family_and_initials()}|"
      info += "#{self.git}|"
      if self.phone != nil then info += "phone:#{self.phone}"
      elsif self.tg != nil then info += "tg:#{self.tg}"
      elsif self.mail != nil then info += "mail:#{self.mail}"
      end
      return info
   end
   
   ### CLASS METHODS
   public
   
   def self.is_family_and_initials(string)
      return string.match(/^[a-zA-Zа-яА-Я]+ [a-zA-Zа-яА-Я].[a-zA-Zа-яА-Я].$/)
   end
   
end