# file i/o

# creating the file handle
input_file = open("/users/isarkar/methods2021/data/brfss_ri_2019.txt", "r")

# dictionary for encoding
asthma_dx_dict = Dict()
asthma_dx_dict["1"] = "Yes"
asthma_dx_dict["2"] = "No"
asthma_dx_dict["7"] = "Dunno"
asthma_dx_dict["9"] = "Do not like you"
asthma_dx_dict[" "] = "Ignoring ya"

# dictionary to keep track of counts
asthma_dx_count_dict = Dict()

for line in readlines(input_file)

    state_value = line[1:2]
    asthma_dx_value = line[120]

    #println("$state_value  $asthma_dx_value")

    if haskey(asthma_dx_count_dict, asthma_dx_value)
        asthma_dx_count_dict[asthma_dx_value] += 1
    else
        asthma_dx_count_dict[asthma_dx_value] = 1
    end

    

end

println("print out counts for asthma")

output_file = open("isarkar_program4_output.txt", "w")

# print out countss
for key in keys(asthma_dx_count_dict)

    translated_value = asthma_dx_dict["$key"]

    println("$key ($translated_value) occurs $(asthma_dx_count_dict[key]) times")

    write(output_file, "$key ($translated_value) occurs $(asthma_dx_count_dict[key]) times\n")

end
