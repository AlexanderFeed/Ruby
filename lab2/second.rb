#класс студентов
class Student
   attr_accessor :id, :first_name, :last_name, :sur_name,:phone,:tg, :mail, :git

   #инициилизирующая функция
   def initialize(hash)
      if(hash[:id] == nil or hash[:first_name] == nil or hash[:last_name] == nil or hash[:sur_name] == nil)
         raise " ID и ФИО обязательно!"
      end
      set_id(hash[:id])
      set_first_name(hash[:first_name])
      set_last_name(hash[:last_name])
      set_sur_name(hash[:sur_name])
      set_phone(hash[:phone])
      set_tg(hash[:tg])
      set_mail(hash[:mail])
      set_git(hash[:git])
   end

   def set_id(some_id) 
         if some_id =~ /\d*/
            @id = some_id
         else
            raise "Pishi ciferki"
         end
   end


   def set_first_name(new_name) 
         if new_name =~ (/^[a-zA-Z]+$/)
            @first_name = new_name.capitalize
         else
            raise "Pishi NE po Russki"
         end
   end

   def set_last_name(new_name) 
         if new_name =~(/^[a-zA-Z]+$/)
            @last_name = new_name.capitalize
         else
            raise "Pishi NE po Russki"
         end
   end

   def set_sur_name(new_name) 
         if new_name =~(/^[a-zA-Z]+$/)
            @sur_name = new_name.capitalize
         else
            raise "Pishi NE po Russki"
         end
   end

   def set_phone(new_number)
      if new_number.class == String
         if new_number == ""
            @phone_number = ""
            return
         end
         if Student.valid_telephone?(new_number)
            @phone_number = new_number
         else
            raise "Incorect."
         end
      elsif new_number.class == Integer
         set_phone_number(new_number.to_s)
      else
         raise "STR or INT."
      end
   end

   def set_mail(new_mail)
      if new_mail == ""
         @email = ""
      elsif new_mail =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
         @email = new_mail
      else
         raise "Incorect mail."
      end
   end
   
   def set_tg(new_tg)
         if new_tg == ""
            @tg = ""
            return
         end
         if new_tg =~ /\A@\w*\z/
            @tg = new_tg
         else
            raise "Wrong telegram."
         end
   end
   
   def set_git(new_git)
      if new_git == ""
         @git = ""
      elsif new_git =~(/(https\:\/\/)?((github)|(gitlab))\.(com)\/\w+/)
         @git = new_git
      else
         raise"Wrong git."
      end
   end





   def self.valid_telephone?(number)
      return true unless (number =~ /^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/).nil?
      false
   end

end