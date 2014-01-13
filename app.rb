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

		get "/depth" do
			if @@depth_maze.to_visit.length == 0
				@@depth_maze = MazeSolverDepth.new("./lib/maze.txt")
			end
			@@breadth_maze.step_path
			@my_maze_path = @@breadth_maze.maze_path
			@my_maze = @@breadth_maze.maze
			erb :depth
		end

	end
end