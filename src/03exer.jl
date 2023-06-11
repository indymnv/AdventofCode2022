using DelimitedFiles

function read_file(input::String)
	output=readdlm(input, skipblanks = false)
	clean_output = Array{String}(output)
	return clean_output
end

function match(opponent_game::String, your_game::String)
	#Define the rules to get the score - return the total score of a tipical game
	score_shape = Dict("X" => 0, 
						"Y" =>3,
						"Z" => 6,)

	score_matrix= Dict("X" => 1, 
						"Y" =>2,
						"Z" => 3,)


	dictionary_oponent =  Dict("A"=>1, 
						"B" =>2 ,
						"C"=>3, )

	game_matrix = [3 1  2 ; 1 2 3; 2 3 1]
	
	total_score =game_matrix[score_matrix[your_game],dictionary_oponent[opponent_game]]	 + score_shape[your_game]
 
	return total_score
		
end

function tournament(data)
	#Iterate around the data and store the total score of all matchs
	total_score = 0
	for i in 1:length(data[:,1])
		total_score = total_score + match(data[i,1], data[i,2])
	end
	return total_score
end

data = read_file("./src/input03.txt")

final_score = tournament(data)
println(final_score)

