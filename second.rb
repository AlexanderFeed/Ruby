#класс студентов
class Student
   attr_accessor :id, :first_name, :last_name, :sur_name,:phone,:tg, :mail, :git
   #attr_reader :name
   #attr_writer :name
   #инициилизирующая функция
   def initialize(id,first_name, last_name, sur_name,phone,tg, mail, git)
      @id = id
      @first_name = first_name
      @last_name = last_name
      @sur_name = sur_name
      @phone = phone
      @tg = tg
      @mail = mail
      @git = git    
   end
end