#10 22 34 46 58

#находим коллисчество минимальных массива в этом интервала
def min_in_interval(arr, interval)
	a = interval[0]
	b = interval[1]
	temp = arr.filter{|item| item > a && b > item}
	temp.count(temp.min)
end
#считываем из файла
def readfile(filepath)
	File.new(filepath, "r:UTF-8")	
end
# Находит элементы, значение которых принадлежит отрезку
def prinadleg_otrez(arr, otrez)
	a = otrez[0]
	b = otrez[1]
	temp = arr.filter{|item| item >= a && b >= item}
	temp.count
end

def obratnaya_sortir(arr)
	arr.sort.reverse
end
def main
	#10
	#path = "C:/Users/dfdtr/OneDrive/Documents/GitHub/Ruby/arr4.txt"
	#readfile(path)
	#lines = file.readlines
	#perv = lines[0].split
	#vtor = lines[1].split
	#конъюнкция 
	#p(perv&vtor).size

	#22
	#path = "C:/Users/dfdtr/OneDrive/Documents/GitHub/Ruby/arr4.22.txt"
	#file = readfile(path)
	#lines = file.readlines
	#arra = lines[0].split.map{|item|item.to_i}
	#intervalishe = lines[1].split.map{|item|item.to_i}
	#p(min_in_interval(arra, intervalishe))

	#34
	#path = "C:/Users/dfdtr/OneDrive/Documents/GitHub/Ruby/arr4.34.txt"
	#file = readfile(path)
	#lines = file.readlines
	#arra = lines[0].split.map{|item|item.to_i}
	#intervalishe = lines[1].split.map{|item|item.to_i}
	#p(prinadleg_otrez(arra, intervalishe))

	#46
	path = "C:/Users/dfdtr/OneDrive/Documents/GitHub/Ruby/arr4.46.txt"
	file = readfile(path)
	lines = file.readlines
	arra = lines[0].split.map{|item|item.to_i}
	p(obratnaya_sortir(arra))
end


main()

