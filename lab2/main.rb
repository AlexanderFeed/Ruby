require_relative 'student'
options = {id: '1',first_name:"Sasha", last_name: "Kolya", sur_name: "Mishch",phone:"89186832818",tg:"@tgtg", mail:"kek@mail.ru", git:"https://github.com/AlexanderFeed/"}
sasha = Student.new(options)
stud2 = Student.new({id: '1',first_name:"Kolya", last_name: "Sasha", sur_name: "Kish", phone:"89991231245", git:"https://github.com/AlexanderFeed/"})
#p sasha.first_name
#p sasha.last_name
#sasha.tg = "new TG"
#p sasha.git
#p sasha.validate()
p stud2
p stud2.mail()
stud2.set_contacts({mail:"kek2@mail.ru"})
p stud2
p stud2.mail()