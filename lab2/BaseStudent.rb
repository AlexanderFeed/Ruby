class BaseStudent

   #инициилизирующая функция
   def initialize(hash)
            constr_hash(hash)
   end

   def constr_hash(hash)
      self.id = hash[:id]
      self.git = hash[:git]
      set_contacts({mail:hash[:mail],phone:hash[:phone],tg:hash[:tg]})
   end

   def id=(some_id) 
         if BaseStudent.valid_id?(some_id)
            @id = some_id.to_i
         else
            raise ArgumentError.new "Введите значение типа int."
         end
   end

   def phone=(new_number)
      if new_number.class == String
         if new_number == ""
            @phone = ""
            return
         end
         if Student.valid_telephone?(new_number)
            @phone = new_number
         else
            raise ArgumentError.new "Incorect."
         end
      elsif new_number.class == Integer
         set_phone(new_number.to_s)
      else
         raise ArgumentError.new "STR or INT."
      end
   end

   def mail=(new_mail)
      if new_mail == nil or new_mail == ""
         @mail = nil
      elsif Student.valid_mail?(new_mail)
         @mail = new_mail
      else
         raise ArgumentError.new "Incorect mail."
      end
   end
   
   def tg=(new_tg)
         if new_tg == nil or new_tg == ""
            @tg = nil
            return
         end
         if Student.valid_tg?(new_tg)
            @tg = new_tg
         else
            raise ArgumentError.new "Wrong telegram."
         end
   end
   
   def git=(new_git)
      if new_git == nil or new_git == ""
         @git = nil
      elsif Student.valid_git?(new_git)
         @git = new_git
      else
         raise ArgumentError.new "Wrong git."
      end
   end

    def set_contacts(contacts)
      self.mail = (contacts[:mail]) if(contacts[:mail] != nil)
      self.phone = (contacts[:phone]) if(contacts[:phone] != nil)
      self.tg = (contacts[:tg]) if(contacts[:tg] != nil)
   end

   def get_contact()
      if(self.mail != nil)
         return "#{self.mail}"
      elsif (self.phone !=nil)
         return "#{self.phone}"
      else
         return "#{self.tg}"
      end
   end

    def self.valid_id?(check_id)
      return true unless (check_id =~ /\d*/).nil?
      false
   end

   def self.valid_telephone?(number)
      return true unless (number =~ /^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/).nil?
      false
   end

   def self.valid_mail?(check_mail)
      return true unless (check_mail =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i).nil?
      false
   end

   def self.valid_tg?(check_mail)
      return true unless (check_mail =~ /\A@\w*\z/).nil?
      false
   end

   def self.valid_git?(check_git)
      return true unless (check_git =~ /(https\:\/\/)?((github)|(gitlab))\.(com)\/\w+/).nil?
      false
   end

   #def some_git?()
   #   return git != nil
   #end
   #def some_phone?()
   #   return phone != nil
   #end
   #def some_tg?()
   #   return tg != nil
   #end
   #def some_mail?()
   #   return mail != nil
   #end
   def some_connect?()
      return(some_mail?() and some_phone?() and some_mail?())
   end

   def validate?()
      return(some_connect?() and some_git?())
   end

   public attr_reader :id, :git
   private attr_reader  :phone,:tg, :mail

end