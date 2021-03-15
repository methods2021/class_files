# program3.jl
# arrays, sets, and dictionaries


# ask user to enter a phrase that is at least 5 words long
print("enter a phrase: ")
phrase = readline(stdin)

# tell the user the length of the phrase
println("length of the phrase is: $(length(phrase))")

# report the second character
println("second char is $(phrase[2])")

# report the first 3 characters
println("first three chraracters are: $(phrase[1:3])")

# report the last 3 characters
println("the last three characters are: $(phrase[end-2:end])")

# create an array
word_array = []
word_array = split(phrase, " ")

# check for number of words; if less than 5, ask again
while length(word_array) < 5
    print("too short; enter another phrase: ")
    global phrase = readline(stdin)
    global word_array = split(phrase," ")
end

# report out the contents of the array
for word_num in 1:length(word_array)
    println("**** ARRAY **** word $word_num is $(word_array[word_num])")
end

for word in word_array
    println("[array]  $word")
end

# report out the second and third words of the array
println("the second and third words are $(word_array[2:3])")

# load array into set
word_set = Set()

for word in word_array
    push!(word_set, word)
end

# print out the contents of the set
for word in word_set
    println("[set]  $word")
end


# create dictionary
translated_word_dict = Dict()
translated_word_dict["to"] = "2"
translated_word_dict["be"] = "B"

for key in keys(translated_word_dict)
    println("[dict] \"$key\" >> $(translated_word_dict[key])")
end

# translate contents of array
for word in word_array
    
    #println(translated_word_dict[word])
    
    if haskey(translated_word_dict, word)
        println(translated_word_dict[word])
    else
        println(word)
    end

end

##### BEGIN CLASS EXERCISE
## Until the user types "stop,stop", ask the user for translations as key,value
## pairs that will be used to convert phrases later. Then:
##		(1) Reports the keys in the order that they were entered
##		(2) Reports the unique list of keys
##		(3) Asks the user for 3 words to translate, and reports the translation

key_val_pair = ""


translate_dict = Dict()
key_array = []
key_set = Set()

print("enter a translation (as \"key,value\"): ")
key_val_pair = readline(stdin)

while key_val_pair != "stop,stop"

	key_val_array = split(key_val_pair, ",")

	key = key_val_array[1]
	val = key_val_array[2]

	push!(key_array, key)
	push!(key_set, key)

	translate_dict[key] = val
	print("enter a translation (as \"key,value\"): ")
	global key_val_pair = readline(stdin)
end

println("thanks. The order that keys were entered was:")
for key in key_array
	println(key)
end

println("\nwhich consisted of the following unique keys:")
for key in key_set
	println(key)
end

for word_count in 1:3
	print("give me a word/phrase to translate ($word_count): ")
	translate_phrase = readline(stdin)

	if haskey(translate_dict, translate_phrase)
		translation = translate_dict[translate_phrase]
		println("that translates to: $translation")
	else
		println("no translation available")
	end

end

























