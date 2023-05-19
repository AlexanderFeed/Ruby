require_relative 'student'
require_relative 'StudentShort'
require_relative 'data_table'
require_relative 'data_list'
require_relative 'data_list_student_short'
require_relative "student_list_txt"
options = {id: '1',first_name:"Sasha", last_name: "Kolya", sur_name: "Mishch",phone:"89186832818",tg:"@tgtg", mail:"kek@mail.ru", git:"https://github.com/AlexanderFeed/"}
#sasha = Student.new(hash:{id: '1',first_name:"Sasha", last_name: "Kolya", sur_name: "Mishch",phone:"89186832818",tg:"@tgtg", mail:"kek@mail.ru", git:"https://github.com/AlexanderFeed/"})
#stud2 = Student.new({id: '1',first_name:"Kolya", last_name: "Sasha", sur_name: "Kish", phone:"89991231245", git:"https://github.com/AlexanderFeed/"})
#p sasha.first_name
#p sasha.last_name
#sasha.tg = "new TG"
#p sasha.git
#p sasha.validate()
#object1 = Student.new()
#option2 = "123|kek|nekek|netda|8-988-6832818|hochukushatt|kek@mail.ru|https://github.com/AlexanderFeed/"
object0 = Student.init_str("123|kek|nekek|netda|89886832818|@hochukushatt|kek@mail.ru|https://github.com/AlexanderFeed/")
object3 = Student.new(options)
#p object0.tg()
#p object0.phone()
#p object0.get_info()

#students.each { |obj| puts obj.get_info }
#Student.write_to_txt("out_t.txt", students)


#matric = [[9,8,7,6],[5,4,3,2]]
#raz = DataTable.new(matric)
#p raz.get_element(0,2)

#arr = [1,2,3,4,5]
#dva = DataList.new(arr)
#dva.select(1)
#dva.select(2)
#p dva.get_selected()
students = [object0,object3,object0,object3]
list = DataListStudentShort.new(students)
p list.get_names()
tri = list.get_data()
p tri.get_element(1,0)
#p BaseStudent.valid_id?("123")
#studentslist = StudentListTxt.new()
#studentslist.read_file("in_t.txt")
#studentslist.sort()
#studentslist.replace_student(123, object0)
#dlss = studentslist.get_k_n_student_short_list(0,5)
#dt = dlss.get_data()
#puts dt.get_element(1,1)