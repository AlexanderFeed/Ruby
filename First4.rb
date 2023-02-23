#10 22 34 46 58
require 'set'

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
#обратно сортирует массив
def obratnaya_sortir(arr)
	arr.sort.reverse
end
#находит все суммы пар массива
def all_sums(arra,sums = [])
	if arra == []
		return sums
	end
	sums = (arra.map{|elem| elem + arra[0] }) + sums
	arra.shift
	sums.shift
	all_sums(arra, sums)
end
#считает количестов эллементов сумма которых может быть получено их двух других
def count_sum(arr,vse_summi, i=0,count=0)
	if i==arr.length  
		answer = count 
		return answer
	end 
	vse_summi.include?(arr[i]) ? count_sum(arr, vse_summi, i+1, count+1) : count_sum(arr, vse_summi, i+1, count)
	
end
#основная функция
def main
	case ARGV[0].to_i 
	#10
	when 1
		path = "C:/Users/dfdtr/OneDrive/Documents/GitHub/Ruby/arr4.txt"
		lines = readfile(path).readlines
		perv = lines[0].split
		vtor = lines[1].split
		#конъюнкция 
		p(perv&vtor).size

	#22
	when 2
		path = "C:/Users/dfdtr/OneDrive/Documents/GitHub/Ruby/arr4.22.txt"
		lines = readfile(path).readlines
		arra = lines[0].split.map{|item|item.to_i}
		intervalishe = lines[1].split.map{|item|item.to_i}
		p(min_in_interval(arra, intervalishe))

	#34
	when 3
		path = "C:/Users/dfdtr/OneDrive/Documents/GitHub/Ruby/arr4.34.txt"
		lines = readfile(path).readlines
		arra = lines[0].split.map{|item|item.to_i}
		intervalishe = lines[1].split.map{|item|item.to_i}
		p(prinadleg_otrez(arra, intervalishe))

	#46
	when 4
		path = "C:/Users/dfdtr/OneDrive/Documents/GitHub/Ruby/arr4.46.txt"
		lines = readfile(path).readlines
		arra = lines[0].split.map{|item|item.to_i}
		p(obratnaya_sortir(arra))

	#58 
	when 5
		path = "C:/Users/dfdtr/OneDrive/Documents/GitHub/Ruby/arr4.58.txt"
		lines = readfile(path).readlines
		arra = lines[0].split.map{|item|item.to_i}
		vse_summi = all_sums(arra) #????????
		arra = lines[0].split.map{|item|item.to_i}
		p(count_sum(arra, vse_summi))
	else 
		nil
	end
end


main()

