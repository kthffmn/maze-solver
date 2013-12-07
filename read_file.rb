#############
## R E A D ##
#############

maze = []
file = File.new("maze.txt", "r")
while (line = file.gets)
	row = line.split("").collect {|c| c == " "}
	maze << row[0...-1] # excludes carriage return character
end
file.close

maze
height = maze.length
width = maze[0].length

# [[false, false, false, false, false, false, false, false, false, false, false], 
#  [false, true, true, true, true, true, true, true, true, true, false],
#  [false, true, false, false, false, false, false, true, false, true, false], 
#  [true,  true, true, true, false, true, true, true, false, true, false], 
#  [false, false, false, true, false, true, false, false, false, true, false], 
#  [false, true, true, true, true, true, false, true, true, true, false],  
#  [false, true, false, true, false, false, false, true, false, false, false], 
#  [false, true, false, true, true, true, false, true, true, true, true], 
#  [false, true, false, false, false, true, false, true, false, true, false], 
#  [false, true, true, true, true, true, false, true, true, true, false], 
#  [false, false, false, false, false, false, false, false, false, false]]

start_x = 0
start_y = 0
until maze[start_y][start_x]
	start_y += 1
end

start_y # 3 (integer)

maze_path = Array.new(height) {Array.new(width)}
maze_path[start_y][start_x] = "start"

	def nil?(x, y)
		if y >= 0 && x >= 0 && y < height && x < width && maze[y][x] && maze_path[y][x] == nil
			[x, y]
		else
			nil
		end
	end

	def neighbors(x, y)
		neighbor_coordinates = [ nil?(x + 1, y + 1),
								 nil?(x + 1, y - 1), 
								 nil?(x + 1, y    ), 
								 nil?(x - 1, y + 1),
								 nil?(x - 1, y - 1), 
								 nil?(x - 1, y    ), 
								 nil?(x    , y + 1), 
								 nil?(x    , y - 1)  ]
		neighbor_coordinates.compact
	end


to_visit = [[start_x, start_y]] # first loop => [[0,3]]  second loop => [[1,3]]
while to_vist.length > 0
	x, y = to_visit.pop #change "pop" (takes off last element) to "shift" to do first, to_visit = [] b/c pop is a bang method
	next_vist = neighbors(x, y) # array with coordinates of locations of empty && unvisited neighbors => [[1, 3]]
	next_visit.each{|neighbor_x, neighbor_y| maze_path[neighbor_y][neighbor_x] = [x, y]} # where x and y are where we are currently !!! smart breadcrumb !!!
		# maze_path[3][1] = [0,3]
	to_vist += next_visit
end

################
#F I N D E N D #
################

so when maze[any height][width] == true, you want to retrace your steps by going into the identical maze_path x, y corrdinates and tracing those corrdinates backwards until the [any height][0] == 

# find end
end_x = width - 1
end_y = 0
until maze[end_y][end_x]
	end_y += 1
end

# starting at end_x end_y trace way back through maze_path
# make empty array, record corrdinates of path
# array = []
# << corrdinates
# reverse array becuase otherwise it goes from end to beginning
# print whole maze using maze array but every time print " ", check if it's in the path and if yes, print "x"


