#класс студентов
require_relative "BaseStudent.rb"
class Student < BaseStudent
   attr_reader :first_name, :last_name, :sur_name

   #инициилизирующая функция
   def initialize(hash)
      if(hash != nil)
         if(hash[:first_name] == nil or hash[:last_name] == nil or hash[:sur_name] == nil)
            raise "ID и ФИО обязательно!"
         else
            constr_hash(hash)
         end
      end
   end

   def Student.init_str(string)
      splitted = string.split('|')
      if splitted.length != 8 
         raise ArgumentError.new "Wrong string format for constructor."
      end
      new({id:splitted[0], first_name:splitted[1], last_name:splitted[2], sur_name:splitted[3], phone:splitted[4], tg:splitted[5], mail:splitted[6], git:splitted[7]})
   end



   def constr_hash(hash)
      self.first_name = hash[:first_name]
      self.last_name = hash[:last_name]
      self.sur_name = hash[:sur_name]
      super({id:hash[:id], phone:hash[:phone],tg:hash[:tg],mail:hash[:mail], git:hash[:git]})

   end


   def first_name=(new_name) 
         if Student.valid_name?(new_name)
            @first_name = new_name.capitalize
         else
            raise ArgumentError.new "Wrong first name."
         end
   end


   def last_name=(new_name) 
         if Student.valid_name?(new_name)
            @last_name = new_name.capitalize
         else
            raise ArgumentError.new "Wrong last name."
         end
   end

   def sur_name=(new_name) 
         if Student.valid_name?(new_name)
            @sur_name = new_name.capitalize
         else
            raise ArgumentError.new "Wrong surname."
         end
   end

   def self.valid_name?(check_name)
      return true unless (check_name =~ /^[a-zA-Z]+$/).nil?
      false
   end


   def get_info()
      info = "Name: "
      info += self.sur_name + " " + self.first_name[0] + "." + self.last_name[0] + "\n"
      if self.phone != nil 
         info += "Phone: " + self.phone + "\n"
      elsif
         self.tg != nil 
         info += "Tg: " + self.tg + "\n"
      elsif
         self.mail != nil 
         info += "Email: " + self.mail + "\n"
      end
      if self.git != nil 
         info +="Git: " + self.git + "\n"
      end
      return info
   end


   def get_full_short()
      return "#{self.sur_name}" + "#{self.first_name[0]}" + "#{self.last_name[0]}" 

   end

   def self.read_from_txt(path)
      objects = []
      File.open(path, "r") do |file|
         file.each_line { |x| objects.push(Student.init_str(x[0..-2])) }
      end
      return objects
   end

   def get_txt_info
      info = self.sur_name + "|" + self.first_name[0] + "|" + self.last_name[0] + "|"
      if self.phone != nil 
         info += self.phone + "|"
      elsif
         self.tg != nil 
         info += self.tg + "|"
      elsif
         self.mail != nil 
         info += self.mail + "|"
      end
      if self.git != nil 
         info += self.git + "|"
      end
      return info
   end

   def self.write_to_txt(path, array)
      File.open(path, "w") do |file|
         array.each { |obj| file.write(obj.get_txt_info()) }
      end
   end

end