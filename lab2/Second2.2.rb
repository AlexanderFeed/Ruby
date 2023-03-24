require_relative 'second'
options = {id: '1',first_name:"Sasha", last_name: "Kolya", sur_name: "Mishch",phone:"89186832818",tg:"@tgtg", mail:"kek@mail.ru", git:"https://github.com/AlexanderFeed/"}
sasha = Student.new(options)
p sasha.first_name
p sasha.last_name
sasha.tg = "new TG"
p sasha.tg