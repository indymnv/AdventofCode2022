using DelimitedFiles

function read_file(input::String)
		output=readdlm("./src/input01.txt", skipblanks = false)
		replace!(output, "" =>missing)
		clean_output = Array{Union{Missing, Int64}}(output)
		return clean_output
end

data = read_file("./src/input01.txt")

function max_calories(data_input::Matrix{Union{Missing, Int64}})
		max_calories_elf = 0
		last_missing = 1 #define origin
		for i in 1:length(data_input)
				if ismissing(data_input[i])  || i == length(data_input)
						total_calories_elf = sum(skipmissing(data_input[last_missing:i]))
						last_missing = i
						if total_calories_elf > max_calories_elf
								max_calories_elf = total_calories_elf
						end
				end
		end
		return max_calories_elf
end	
						
println(max_calories(data))
