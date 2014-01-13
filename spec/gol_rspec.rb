###############################
###  R S P E C   4   G O L  ###
###############################

require './cell.rb'
require './game.rb'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :progress # :progress, :html, :textmate
end

describe Cell, "#initialize" do
	it "should be able to initialize a cell class" do
		game = Game.new(3, 3)
    	lambda {Cell.new(3, 3, game)}.should_not raise_error
 	end
 end

describe Game, "#initialize" do
	it "should be able to initialize a board" do
    	lambda {Game.new(3, 3)}.should_not raise_error
 	end
 end

describe Game, "#make_cells" do
	it "should make a cell at a particular location on the board" do
		game = Game.new(3,3)
		game.make_cells
		expect(game.board[1][1]).to be_a(Cell)
 	end
 end

describe Cell, "#destiny" do
	it "should die if it has less than two live neighbors" do
		game = Game.new(3,3)
 		game.make_cells
 		game.board[1][1].status = true
 		game.board[1][1].destiny
		expect(game.board[1][1].status).to eq(false)
	end
	it "should live if has 2-3 live neighbors" do
		game = Game.new(3,3)
 		game.make_cells
 		game.board[1][1].status = true
 	 	game.board[1][0].status = true
 		game.board[0][1].status = true
		game.board[1][1].destiny
		expect(game.board[1][1].status).to eq(true)
	end
	it "should die if has 4-8 live neighbors" do
		game = Game.new(3,3)
 		game.make_cells
 		game.board[1][1].status = true
 	 	game.board[1][0].status = true
 		game.board[0][1].status = true
 	 	game.board[2][0].status = true
 	 	game.board[0][0].status = true
		game.board[1][1].destiny
		expect(game.board[1][1].status).to eq(false)
	end
	it "should  come to life if it has 3 live neighbors" do
		game = Game.new(3,3)
 		game.make_cells
 		game.board[2][1].status = true
 	 	game.board[1][0].status = true
 		game.board[0][1].status = true
		game.board[1][1].destiny
		expect(game.board[1][1].status).to eq(true)
	end
end