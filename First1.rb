#puts "Hello World"
#puts "Введите имя: "
puts ARGV[0]
puts "Hello, #{ARGV[0]}"
if (ARGV[0] == nil)
  abort "Нужно имя!"
end
puts "Введите любимый яп"

lang = STDIN.gets.chomp

if lang == "C++" then
	puts "Скоро понравится Ruby"
else end
	if lang == "C#"
		puts "Скоро понравится Ruby"
	elsif   lang == "Ruby"
					puts "Ты подлиза"
		elsif  lang == "Python"
					 puts "Тебе понравится Руби"	 
		else puts "Я не знаю такого языка, но тебе точно понравится Ruby"

end
puts "Идем дальше. Введите команду Ruby: "

r_com = STDIN.gets.chomp

r_com = `ruby -e  '#{r_com}'`
puts r_com
puts "Идем дальше. Введите команду OC: "
oc_com = STDIN.gets.chomp
oc_com = `#{oc_com}`
puts oc_com

puts "Endendend"