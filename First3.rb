#находит минимальный элемент массива
def min_elem(arr)
	min = arr[0]
	for i in arr
		i.to_i
		if i < min 
			min = i
		end

	end
	return min
end
#находит индекс первого положительного элемента массива
def perv_polog(arr)
	for i in 0..arr.length
		if arr[i].to_i>0
			return i
		end
	end
end
#Считываем из файла
file = File.new(ARGV[1], "r:UTF-8")
content = file.read.split
#Принимаем аргументы программы
if ARGV[0] == '1'
	puts(min_elem(content))
elsif ARGV[0] == '2'	
	puts(perv_polog(content))
end