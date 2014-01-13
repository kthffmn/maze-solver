#######################
### A - M A Z I N G ###
#######################
require 'rainbow'

class MazeSolver
	attr_reader :height, :width, :maze_path, :maze, :to_visit

	def initialize(file_name) # in our case, maze.txt
		@maze = []
		file = File.new("#{file_name}", "r")
		while (line = file.gets)
			row = line.split("").collect {|c| c == " "}
			@maze << row[0...-1] # excludes carriage return character
		end
		file.close
		@height = maze.length
		@width = maze[0].length
		@maze_path = Array.new(height) {Array.new(width)}
		start_x, start_y = find_start
		maze_path[start_y][start_x] = "start"
		@to_visit = [[start_x, start_y]]
	end

	def find_start
		start_x = 0
		start_y = 0
		until maze[start_y][start_x]
			start_y += 1
		end
		[start_x, start_y]
	end

	def find_end
		end_x = width - 1
		end_y = 0
		until maze[end_y][end_x]
			end_y += 1
		end
		[end_x, end_y]
	end

	def nil?(x, y)
		if y >= 0 && x >= 0 && y < height && x < width && maze[y][x] && maze_path[y][x] == nil
			[x, y]
		else
			nil
		end
	end

	def unvisited_neighbors(x, y)
		neighbor_coordinates = [ nil?(x + 1, y    ), 
								 nil?(x - 1, y    ), 
								 nil?(x    , y + 1), 
								 nil?(x    , y - 1)  ]
		neighbor_coordinates.compact
	end

	def step_path
		if @to_visit.length > 0
			x, y = to_visit.shift #  "pop" (depth first) -or- "shift" (breadth first)
			my_neighbors = unvisited_neighbors(x, y)
			my_neighbors.each{|neighbor_x, neighbor_y| maze_path[neighbor_y][neighbor_x] = [x, y]}
			@to_visit += my_neighbors
		end
	end

	def animate_path
		while @to_visit.length > 0
			sleep(0.3)
			step_path
			system 'clear'
			print_path
		end
	end

	def get_correct_path
		correct_path = Array.new(height) {Array.new(width)}
		x, y = find_end
		while maze_path[y][x] != "start"
			correct_path[y][x] = true
			x, y = maze_path[y][x]
		end
		correct_path[y][x] = true
		correct_path
	end

	def print_path
		#correct_path = get_correct_path
		h_counter = 0
		while h_counter < height do
			w_counter = 0
			while w_counter < width do
				# if correct_path[h_counter][w_counter]
				if maze_path[h_counter][w_counter]
					print " * ".color(0,0,255)
				elsif maze[h_counter][w_counter]
					print "   "
				else
					print " # ".color(72,72,72)
				end
				w_counter += 1
			end
		h_counter +=1
		print "\n"
		end
	end
end

my_maze = MazeSolver.new("maze.txt")
my_maze.animate_path