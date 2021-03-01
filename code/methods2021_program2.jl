
# my second program

# welcome user
println("hello, welcome to today's program!")
print("enter a phrase: ")
phrase = readline(stdin)

# tell user what they wrote
println("you wrote \"$phrase\"")

# report length of phrase 
phrase_length = length(phrase)
println("the length of your phrase is $phrase_length")

# if the phrase length is less than 10, tell user
if phrase_length < 10
    println("less than 10 characters")
# otherwise if it is 10 characters long, tell user
elseif phrase_length == 10
    println("length is 10 characters")

# or, just tell the user they entered a phrase
else
    println("you entered a phrase")
end

# get first, last, 3-4 character
first_char = phrase[1]
last_char  = phrase[phrase_length]
short_string = phrase[3:4]

println("first char is $first_char")
println("last char is $last_char")
println("short string is \"$short_string\"")

# if the phrase length is less than 10, ask user for another phrase
while phrase_length < 10

    println("your phrase is too short!")
    print("enter another phrase: ")
    global phrase = readline(stdin)
    global phrase_length = length(phrase)
end

println("your phrase is now: $phrase")

# for loop
for number in 3:7
    pos_char = phrase[number]
    println("$number has character \"$pos_char\"")
end


# regular expression to look for patterns
if occursin(r"[abcd]", phrase)
    println("your phrase has an a, b,c, or d!")
end

if occursin(r"[0-9]", phrase)
    println("your phrase has a number!!!")
end

if occursin(r"[A-Z][a-z][a-z] [1-9][0-9]", phrase)

    println("your phrase has something that looks like Aaa 99!")
end

# write a program that asks user to enter a date
# then verify the date was entered in the correct format (mm/dd/yyyy)
# if date was entered correctly, ask user to enter another date
# note: date does not need to be valid just right format

print("enter a date (mm/dd/yyyy): ")
user_date = readline(stdin)

while !occursin(r"[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]", user_date)
    println("*invalid date!")
    print("*enter another date (mm/dd/yyyy): ")
    global user_date = readline(stdin)
end
