using DelimitedFiles

function read_file(path::String)
		f = open(path)
		data = readlines(f)
		return data
end

df = read_file("./src/input04.txt")

function count_total(racksuck::String)
	left_pocket, right_pocket = racksuck[1:Int(round(length(racksuck)/2))],  racksuck[Int(round(length(racksuck)/2))]+1:end]
	
