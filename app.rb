require "bundler"
Bundler.require
require "./lib/breadth.rb"
require "./lib/depth.rb"

module Name
	class App < Sinatra::Application
		@@breadth_maze = MazeSolverBreadth.new("./lib/maze.txt")

		get "/" do
			erb :index
		end

		get "/breadth" do
			@@breadth_maze.step_path
			@my_maze_path = @@breadth_maze.maze_path
			@my_maze = @@breadth_maze.maze
			erb :breadth
		end

		get "/depth" do
			erb :depth
		end
	end
end