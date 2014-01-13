require "bundler"
Bundler.require

require "./lib/breadth.rb"
require "./lib/depth.rb"
# require "./lib/maze.txt"

module Name
	class App < Sinatra::Application

		get "/" do
			erb :index
		end

		get "/breadth" do

			erb :breadth
		end

		get "/depth" do

			erb :depth
		end
	end
end