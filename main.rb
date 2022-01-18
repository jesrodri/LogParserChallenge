class FirstLine
	file = File.open("./spec/fixtures/games.log")
	lines = file.to_a
	print lines.first
	file.close
end
