#класс студентов
class Student
   attr_accessor :id, :first_name, :last_name, :sur_name,:phone,:tg, :mail, :git

   #инициилизирующая функция
   def initialize(hash)
      if(hash[:first_name] == nil or hash[:last_name] == nil or hash[:sur_name] == nil)
         raise "ФИО обязательно!"
      end
      set_id(hash[:id])
      set_first_name(hash[:first_name])
      set_last_name(hash[:last_name])
      set_sur_name(hash[:patronymic]
      set_phone(hash[:phone])
      set_tg(hash[:tg])
      set_mail(hash[:mail])
      set_git(hash[:git])
   end

   def set_first_name(new_name) 
         if new_name.match(/^[a-zA-Z]+$/)
            @first_name = new_name.capitalize
         else
            raise "Pishi NE po Russki"
         end
   end

   def set_last_name(new_name) 
         if new_name.match(/^[a-zA-Z]+$/)
            @last_name = new_name.capitalize
         else
            raise "Pishi NE po Russki"
         end
   end

   def set_sur_name(new_name) 
         if new_name.match(/^[a-zA-Z]+$/)
            @sur_name = new_name.capitalize
         else
            raise "Pishi NE po Russki"
         end
   end
   def self.valid_telephone?(number)
      return true unless (number =~ /^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/).nil?
      false
   end

end