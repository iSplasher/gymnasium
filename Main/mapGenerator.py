with open("map.txt", "w") as f:
	y = 15
	x = 30
	border = '1'
	top = '1'
	bottom = '1'

	f.write(top*x)
	f.write('\n')
	for i in range(y-2):
		f.write(border)
		for j in range(x-2):
			f.write('0')
		f.write(border)
		f.write('\n')
	f.write(bottom*x)



