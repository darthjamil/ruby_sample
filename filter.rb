require "csv"

albums = CSV.read("albums.csv")[1..]
puts albums.select {|record| record[2] == "Jazz" and record[3].to_i.between?(1950, 1959)}
