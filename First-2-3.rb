#определяет взаимно ли простые числа
def vzaim_prost(one, two)
	until one == two
		if one > two
			one -=two
		end
		if two > one
		two -=one
		end
	end
	return one
end

#счиатет колличество эллементов массива, которые четные и взаимнопростые с данным 
def chet_prost_s_dannim (arr,dannoe)
	count =0
	for i in arr do
			if i % 2 == 0 
				if vzaimprost(i, dannoe) != 1
					count +=1
				end
			end
		end
		return count
end
#first
arr = [15,20,3,4,5,17,21,20,2,1]
puts chet_prost_s_dannim(arr,15)

#находит максимальную цифру числа
def max_cifr(chisla)
	max = -1
	while chisla !=0
		if (chisla%10) %3 !=0
			if (chisla%10)>max 
				max = chisla%10
			end
		end
		chisla/=10 
	end
	return max
end
#second
puts max_cifr(1234569)

#находит сумму цифр числа
def sum_cifr(dannoe)
	sum = 0
	while dannoe!=0
		unless dannoe%10 >=5
			sum+=dannoe%10
		end
		dannoe/=10
	end
	return sum
end

#находит произведение суммы цифр числа и максимального не взаимнопростого с данным из масива
def max_proizv (arr, dannoe)
	max = arr[0]
	for i in arr  do
		if i > max
			if vzaimprost(i,dannoe) !=1
				max = i
			end
		end
	end
	return(sumcifr(dannoe) * max)
end
arr2 = [1,2,3,4,5]
puts max_proizv(arr2, 12) 