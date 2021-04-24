require "csv"

def classic_jazz?(record)
    record[2] == "Jazz" and record[3].to_i.between?(1950, 1959)
end

albums = CSV.read("albums.csv")[1..]

for i in 0...albums.size do
    if classic_jazz?(albums[i])
        puts albums[i][0]
    end
end
