require "bundler"
Bundler.require

require "./lib/cell.rb"
require "./lib/game.rb"

module Name
	class App < Sinatra::Application
    @@game = Game.new(28, 40)
    @@game.make_cells

		get "/" do
			erb :home
		end

		get "/next" do
			@@game.select_destiny
			@@game.swap
			@my_board = @@game.board
			erb :next
		end

		get "/reset" do
			@my_board = @@game.board
			w_counter = 0
			h_counter = 0
			while w_counter < 28 do
				while h_counter < 40 do
					@my_board[w_counter][h_counter].status = false
					@my_board[w_counter][h_counter].age = 0
					@my_board[w_counter][h_counter].destiny = false
					h_counter += 1
				end
				h_counter = 0
				w_counter +=1
			end
			erb :reset
		end

		get "/randomize" do
			num_alive = rand(10...800)
			num_alive.times do
				current_cell = @@game.board[rand(0...28)][rand(0...40)]
				current_cell.status = true
				current_cell.age = 1
			end
			@my_board = @@game.board
			erb :rand_index
		end

		get "/glider-gun" do
			# Left Block
			@@game.board[5][1].status = true
			@@game.board[5][2].status = true
			@@game.board[6][1].status = true
			@@game.board[6][2].status = true

			@@game.board[5][1].age = 1
			@@game.board[5][2].age = 1
			@@game.board[6][1].age = 1
			@@game.board[6][2].age = 1

			# Right Block
			@@game.board[3][35].status = true
			@@game.board[3][36].status = true
			@@game.board[4][35].status = true
			@@game.board[4][36].status = true

			@@game.board[3][35].age = 1
			@@game.board[3][36].age = 1
			@@game.board[4][35].age = 1
			@@game.board[4][36].age = 1

			# Columns 11-18
			@@game.board[5][11].status = true # 1
			@@game.board[6][11].status = true # 2
			@@game.board[7][11].status = true # 3
			@@game.board[4][12].status = true # 4
			@@game.board[8][12].status = true # 5
			@@game.board[3][13].status = true # 6
			@@game.board[9][13].status = true # 7
			@@game.board[3][14].status = true # 8
			@@game.board[9][14].status = true # 9
			@@game.board[6][15].status = true # 10
			@@game.board[4][16].status = true # 11
			@@game.board[8][16].status = true # 12
			@@game.board[5][17].status = true # 13
			@@game.board[6][17].status = true # 14
			@@game.board[7][17].status = true # 15
			@@game.board[6][18].status = true # 16

			@@game.board[5][11].age = 1 # 1
			@@game.board[6][11].age = 1 # 2
			@@game.board[7][11].age = 1 # 3
			@@game.board[4][12].age = 1 # 4
			@@game.board[8][12].age = 1 # 5
			@@game.board[3][13].age = 1 # 6
			@@game.board[9][13].age = 1 # 7
			@@game.board[3][14].age = 1 # 8
			@@game.board[9][14].age = 1 # 
			@@game.board[6][15].age = 1 # 10
			@@game.board[4][16].age = 1 # 11
			@@game.board[8][16].age = 1 # 12
			@@game.board[5][17].age = 1 # 13
			@@game.board[6][17].age = 1 # 14
			@@game.board[7][17].age = 1 # 15
			@@game.board[6][18].age = 1 # 16

			# Columns 21-25
			@@game.board[3][21].status = true # 1
			@@game.board[4][21].status = true # 2
			@@game.board[5][21].status = true # 3
			@@game.board[3][22].status = true # 4
			@@game.board[4][22].status = true # 5
			@@game.board[5][22].status = true # 6
			@@game.board[2][23].status = true # 7
			@@game.board[6][23].status = true # 8
			@@game.board[1][25].status = true # 9
			@@game.board[2][25].status = true # 10
			@@game.board[6][25].status = true # 11
			@@game.board[7][25].status = true # 12

			@@game.board[3][21].age = 1 # 1
			@@game.board[4][21].age = 1 # 2
			@@game.board[5][21].age = 1 # 3
			@@game.board[3][22].age = 1 # 4
			@@game.board[4][22].age = 1 # 5
			@@game.board[5][22].age = 1 # 6
			@@game.board[2][23].age = 1 # 7
			@@game.board[6][23].age = 1 # 8
			@@game.board[1][25].age = 1 # 9
			@@game.board[2][25].age = 1 # 10
			@@game.board[6][25].age = 1 # 11
			@@game.board[7][25].age = 1 # 12

			@my_board = @@game.board
			erb :g_g_index
		end

		get "/beehives" do
			@@game.board[5][5 + 2].status = true
			@@game.board[5][5 + 3].status = true
			@@game.board[5][5 + 4].status = true
			@@game.board[5][5 + 8].status = true
			@@game.board[5][5 + 9].status = true
			@@game.board[5][5 + 10].status = true

			@@game.board[5 + 2][5	 ].status = true
			@@game.board[5 + 2][5 + 5 ].status = true
			@@game.board[5 + 2][5 + 7 ].status = true
			@@game.board[5 + 2][5 + 12].status = true

			@@game.board[5 + 3][5	 ].status = true
			@@game.board[5 + 3][5 + 5 ].status = true
			@@game.board[5 + 3][5 + 7 ].status = true
			@@game.board[5 + 3][5 + 12].status = true   

			@@game.board[5 + 4][5	 ].status = true
			@@game.board[5 + 4][5 + 5 ].status = true
			@@game.board[5 + 4][5 + 7 ].status = true
			@@game.board[5 + 4][5 + 12].status = true

			@@game.board[5 + 5][5 + 2 ].status = true
			@@game.board[5 + 5][5 + 3 ].status = true
			@@game.board[5 + 5][5 + 4 ].status = true
			@@game.board[5 + 5][5 + 8 ].status = true
			@@game.board[5 + 5][5 + 9 ].status = true
			@@game.board[5 + 5][5 + 10].status = true

			@@game.board[5 + 7][5 + 2 ].status = true
			@@game.board[5 + 7][5 + 3 ].status = true
			@@game.board[5 + 7][5 + 4 ].status = true
			@@game.board[5 + 7][5 + 8 ].status = true
			@@game.board[5 + 7][5 + 9 ].status = true
			@@game.board[5 + 7][5 + 10].status = true

			@@game.board[5 + 8][5	 ].status = true
			@@game.board[5 + 8][5 + 5 ].status = true
			@@game.board[5 + 8][5 + 7 ].status = true
			@@game.board[5 + 8][5 + 12].status = true

			@@game.board[5 + 9][5	 ].status = true
			@@game.board[5 + 9][5 + 5 ].status = true
			@@game.board[5 + 9][5 + 7 ].status = true
			@@game.board[5 + 9][5 + 12].status = true   

			@@game.board[5 + 10][5	  ].status = true
			@@game.board[5 + 10][5 + 5 ].status = true
			@@game.board[5 + 10][5 + 7 ].status = true
			@@game.board[5 + 10][5 + 12].status = true

			@@game.board[5 + 12][5 + 2 ].status = true
			@@game.board[5 + 12][5 + 3 ].status = true
			@@game.board[5 + 12][5 + 4 ].status = true
			@@game.board[5 + 12][5 + 8 ].status = true
			@@game.board[5 + 12][5 + 9 ].status = true
			@@game.board[5 + 12][5 + 10].status = true 

			@@game.board[5][5 + 2].age = 1
			@@game.board[5][5 + 3].age = 1
			@@game.board[5][5 + 4].age = 1
			@@game.board[5][5 + 8].age = 1
			@@game.board[5][5 + 9].age = 1
			@@game.board[5][5 + 10].age = 1

			@@game.board[5 + 2][5	 ].age = 1
			@@game.board[5 + 2][5 + 5 ].age = 1
			@@game.board[5 + 2][5 + 7 ].age = 1
			@@game.board[5 + 2][5 + 12].age = 1

			@@game.board[5 + 3][5	 ].age = 1
			@@game.board[5 + 3][5 + 5 ].age = 1
			@@game.board[5 + 3][5 + 7 ].age = 1
			@@game.board[5 + 3][5 + 12].age = 1   

			@@game.board[5 + 4][5	 ].age = 1
			@@game.board[5 + 4][5 + 5 ].age = 1
			@@game.board[5 + 4][5 + 7 ].age = 1
			@@game.board[5 + 4][5 + 12].age = 1

			@@game.board[5 + 5][5 + 2 ].age = 1
			@@game.board[5 + 5][5 + 3 ].age = 1
			@@game.board[5 + 5][5 + 4 ].age = 1
			@@game.board[5 + 5][5 + 8 ].age = 1
			@@game.board[5 + 5][5 + 9 ].age = 1
			@@game.board[5 + 5][5 + 10].age = 1

			@@game.board[5 + 7][5 + 2 ].age = 1
			@@game.board[5 + 7][5 + 3 ].age = 1
			@@game.board[5 + 7][5 + 4 ].age = 1
			@@game.board[5 + 7][5 + 8 ].age = 1
			@@game.board[5 + 7][5 + 9 ].age = 1
			@@game.board[5 + 7][5 + 10].age = 1

			@@game.board[5 + 8][5	 ].age = 1
			@@game.board[5 + 8][5 + 5 ].age = 1
			@@game.board[5 + 8][5 + 7 ].age = 1
			@@game.board[5 + 8][5 + 12].age = 1

			@@game.board[5 + 9][5	 ].age = 1
			@@game.board[5 + 9][5 + 5 ].age = 1
			@@game.board[5 + 9][5 + 7 ].age = 1
			@@game.board[5 + 9][5 + 12].age = 1   

			@@game.board[5 + 10][5	  ].age = 1
			@@game.board[5 + 10][5 + 5 ].age = 1
			@@game.board[5 + 10][5 + 7 ].age = 1
			@@game.board[5 + 10][5 + 12].age = 1

			@@game.board[5 + 12][5 + 2 ].age = 1
			@@game.board[5 + 12][5 + 3 ].age = 1
			@@game.board[5 + 12][5 + 4 ].age = 1
			@@game.board[5 + 12][5 + 8 ].age = 1
			@@game.board[5 + 12][5 + 9 ].age = 1
			@@game.board[5 + 12][5 + 10].age = 1 

			@@game.board[5][25 + 2].status = true
			@@game.board[5][25 + 3].status = true
			@@game.board[5][25 + 4].status = true
			@@game.board[5][25 + 8].status = true
			@@game.board[5][25 + 9].status = true
			@@game.board[5][25 + 10].status = true

			@@game.board[5 + 2][25	 ].status = true
			@@game.board[5 + 2][25 + 5 ].status = true
			@@game.board[5 + 2][25 + 7 ].status = true
			@@game.board[5 + 2][25 + 12].status = true

			@@game.board[5 + 3][25	 ].status = true
			@@game.board[5 + 3][25 + 5 ].status = true
			@@game.board[5 + 3][25 + 7 ].status = true
			@@game.board[5 + 3][25 + 12].status = true   

			@@game.board[5 + 4][25	 ].status = true
			@@game.board[5 + 4][25 + 5 ].status = true
			@@game.board[5 + 4][25 + 7 ].status = true
			@@game.board[5 + 4][25 + 12].status = true

			@@game.board[5 + 5][25 + 2 ].status = true
			@@game.board[5 + 5][25 + 3 ].status = true
			@@game.board[5 + 5][25 + 4 ].status = true
			@@game.board[5 + 5][25 + 8 ].status = true
			@@game.board[5 + 5][25 + 9 ].status = true
			@@game.board[5 + 5][25 + 10].status = true

			@@game.board[5 + 7][25 + 2 ].status = true
			@@game.board[5 + 7][25 + 3 ].status = true
			@@game.board[5 + 7][25 + 4 ].status = true
			@@game.board[5 + 7][25 + 8 ].status = true
			@@game.board[5 + 7][25 + 9 ].status = true
			@@game.board[5 + 7][25 + 10].status = true

			@@game.board[5 + 8][25	 ].status = true
			@@game.board[5 + 8][25 + 5 ].status = true
			@@game.board[5 + 8][25 + 7 ].status = true
			@@game.board[5 + 8][25 + 12].status = true

			@@game.board[5 + 9][25	 ].status = true
			@@game.board[5 + 9][25 + 5 ].status = true
			@@game.board[5 + 9][25 + 7 ].status = true
			@@game.board[5 + 9][25 + 12].status = true   

			@@game.board[5 + 10][25	  ].status = true
			@@game.board[5 + 10][25 + 5 ].status = true
			@@game.board[5 + 10][25 + 7 ].status = true
			@@game.board[5 + 10][25 + 12].status = true

			@@game.board[5 + 12][25 + 2 ].status = true
			@@game.board[5 + 12][25 + 3 ].status = true
			@@game.board[5 + 12][25 + 4 ].status = true
			@@game.board[5 + 12][25 + 8 ].status = true
			@@game.board[5 + 12][25 + 9 ].status = true
			@@game.board[5 + 12][25 + 10].status = true 

			@@game.board[5][25 + 2].age = 1
			@@game.board[5][25 + 3].age = 1
			@@game.board[5][25 + 4].age = 1
			@@game.board[5][25 + 8].age = 1
			@@game.board[5][25 + 9].age = 1
			@@game.board[5][25 + 10].age = 1

			@@game.board[5 + 2][25	 ].age = 1
			@@game.board[5 + 2][25 + 5 ].age = 1
			@@game.board[5 + 2][25 + 7 ].age = 1
			@@game.board[5 + 2][25 + 12].age = 1

			@@game.board[5 + 3][25	 ].age = 1
			@@game.board[5 + 3][25 + 5 ].age = 1
			@@game.board[5 + 3][25 + 7 ].age = 1
			@@game.board[5 + 3][25 + 12].age = 1   

			@@game.board[5 + 4][25	 ].age = 1
			@@game.board[5 + 4][25 + 5 ].age = 1
			@@game.board[5 + 4][25 + 7 ].age = 1
			@@game.board[5 + 4][25 + 12].age = 1

			@@game.board[5 + 5][25 + 2 ].age = 1
			@@game.board[5 + 5][25 + 3 ].age = 1
			@@game.board[5 + 5][25 + 4 ].age = 1
			@@game.board[5 + 5][25 + 8 ].age = 1
			@@game.board[5 + 5][25 + 9 ].age = 1
			@@game.board[5 + 5][25 + 10].age = 1

			@@game.board[5 + 7][25 + 2 ].age = 1
			@@game.board[5 + 7][25 + 3 ].age = 1
			@@game.board[5 + 7][25 + 4 ].age = 1
			@@game.board[5 + 7][25 + 8 ].age = 1
			@@game.board[5 + 7][25 + 9 ].age = 1
			@@game.board[5 + 7][25 + 10].age = 1

			@@game.board[5 + 8][25	 ].age = 1
			@@game.board[5 + 8][25 + 5 ].age = 1
			@@game.board[5 + 8][25 + 7 ].age = 1
			@@game.board[5 + 8][25 + 12].age = 1

			@@game.board[5 + 9][25	 ].age = 1
			@@game.board[5 + 9][25 + 5 ].age = 1
			@@game.board[5 + 9][25 + 7 ].age = 1
			@@game.board[5 + 9][25 + 12].age = 1   

			@@game.board[5 + 10][25	  ].age = 1
			@@game.board[5 + 10][25 + 5 ].age = 1
			@@game.board[5 + 10][25 + 7 ].age = 1
			@@game.board[5 + 10][25 + 12].age = 1

			@@game.board[5 + 12][25 + 2 ].age = 1
			@@game.board[5 + 12][25 + 3 ].age = 1
			@@game.board[5 + 12][25 + 4 ].age = 1
			@@game.board[5 + 12][25 + 8 ].age = 1
			@@game.board[5 + 12][25 + 9 ].age = 1
			@@game.board[5 + 12][25 + 10].age = 1 
			
			@my_board = @@game.board
			erb :bee_index
		end
	end
end