#класс студентов
class Student
   attr_accessor :id, :first_name, :last_name, :sur_name,:phone,:tg, :mail, :git
   #attr_reader :name
   #attr_writer :name
   #инициилизирующая функция
   def initialize(options)
      self.id = options[:id]
      self.phone = options[:phone]
      self.tg = options[:tg]
      self.mail = options[:mail]
      self.git = options[:git]   
   end

   def self.valid_telephone?(number)
      return true unless (number =~ /^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/).nil?
      false
   end

end