def vzaimprost(one, two)
	while one != two
		if one > two
			one -=two
		end
		if two > one
		two -=one
		end
	end
	return one
end


def prost (arr,dannoe)
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
puts prost(arr,15)

def maxcifr(chisla)
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
puts maxcifr(1234569)


def sumcifr(dannoe)
	sum = 0
	while dannoe!=0
		if dannoe%10 <5
			sum+=dannoe%10
		end
		dannoe/=10
	end
	return sum
end


def maxproizv (arr, dannoe)
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
puts maxproizv(arr2, 12) 