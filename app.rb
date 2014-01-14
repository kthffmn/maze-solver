require "bundler"
Bundler.require
require "./lib/breadth.rb"
require "./lib/depth.rb"

module Name
	class App < Sinatra::Application
		@@breadth_maze = MazeSolverBreadth.new("./lib/maze.txt")
		@@depth_maze = MazeSolverDepth.new("./lib/maze.txt")

		get "/" do
			erb :index
		end

		get "/breadth" do
			if @@breadth_maze.to_visit.length == 0
				@@breadth_maze = MazeSolverBreadth.new("./lib/maze.txt")
			end
			@@breadth_maze.step_path
			@my_maze_path = @@breadth_maze.maze_path
			@my_maze = @@breadth_maze.maze
			erb :breadth
		end

		get "/breadth/solution" do
			@@breadth_maze.step_path_with_while
			@my_correct_path = @@breadth_maze.get_correct_path
			@my_maze = @@breadth_maze.maze
		end

		get "/depth" do
			if @@depth_maze.to_visit.length == 0
				@@depth_maze = MazeSolverDepth.new("./lib/maze.txt")
			end
			@@depth_maze.step_path
			@my_maze_path = @@depth_maze.maze_path
			@my_maze = @@depth_maze.maze
			erb :depth
		end

		get "/depth/solution" do
			@@depth_maze.step_path_with_while
			@my_correct_path = @@depth_maze.get_correct_path
			@my_maze = @@depth_maze.maze
		end

	end
end