require_relative 'second'
options = {id: 1,first_name:"Sasha", last_name: "Kolya", sur_name: "Mishch",phone: "8989",tg: "tg/tg", mail:"@mail", git: "git/git"}
sasha = Student.new(options)
p sasha.tg
sasha.tg = "new TG"