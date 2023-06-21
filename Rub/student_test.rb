require "test/unit"
require_relative "student/student.rb"
require 'json'
class StudentTest<Test::Unit::TestCase
  def setup
    @student = Student.new_string("404;Тест;Тестов;Тестович;89186832818;test@test.ru;@test;github.com/waas")
  end

  def teardown
    # метод который отвечает за то, что делать после выполнения всех тестов
  end

  def test_student_create
    assert @student.name == 'Тест'
    assert @student.family == 'Тестов'
    assert @student.patronymic == 'Тестович'
    assert @student.id == 404
    assert @student.phone_number == '89186832818'
    assert @student.telegram == '@test'
    assert @student.email == 'test@test.ru'
    assert @student.git == 'github.com/waas'
  end


  def test_student_has_contacts
    assert @student.contacts? == true
  end

  def test_student_has_git
    assert @student.git? == true
  end

  def test_student_set_contacts
    stud = Student.new_string("404;Тест;Тестов;Тестович;89186832818;test@test.ru;@test;github.com/waas")
    stud.set_contacts(phone_number: '77777777777', telegram: '@boss777', email: 'likeaboss@gmail.com')

    assert stud.phone_number == '77777777777'
    assert stud.telegram == '@boss777'
    assert stud.email == 'likeaboss@gmail.com'
  end


  def test_student_to_hash
    test_hash = ({
      name: 'Александр',  
      patronymic: 'Николаевич',
      family: 'Мищенко',
      id: 2,
      phone_number: '89186832818',
      telegram: '@ilove',
      email: 'nowrim@mail.ru',
      git: 'github.com/alex'
    })
    #Student.new_hash({id:0, name:"Arbux", family:"Alebarod", patronymic:"Achekavich", phone_number:"+79189356731", email:"address@mail.sd", telegram:"@ahto_ahaha", git:"https://github.com/CyBeR_uSeR"})
    stud = Student.new_hash(test_hash)

    assert stud.patronymic == 'Николаевич'
    assert stud.name == 'Александр'
    assert stud.family == 'Мищенко'
    assert stud.id == 2
    assert stud.phone_number == '89186832818'
    assert stud.telegram == '@ilove'
    assert stud.email == 'nowrim@mail.ru'
    assert stud.git == 'github.com/alex'

  end
end
