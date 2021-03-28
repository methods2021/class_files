# 1_extract_dx_base.jl

data_file = "data/ADMISSIONS.csv"

flag = 0

for line in readlines(data_file)

    #skip first line
    if flag == 0
       continue
    end

    # split line into array, based on delimiter (comma and space)
    line_array = split(line, ",")

    # get diagnosis (field 17)
    dx = line_array[17]

    println(dx)

end
