# my first program
# written by Neil Sarkar
#
# 2021-02-08

# welcome user
println("hello, welcome to my program!")

# ask user if having nice day
println("are you having a nice day?")
user_response = readline(stdin)
 
# tell the user what they said
println("glad to hear that you are having a $user_response day!")

println("what is your favorite number?")
fav_number = parse(Float64, readline(stdin))

println("i like the number $fav_number, too!")

double_fav_number = fav_number * 2

println("twice your number is $double_fav_number")


if double_fav_number > 5 
    println("your doubled number is larger than 5!")
elseif double_fav_number == 4
    println("your doubled number is four!")
else
    println("i don't know what to do with you...")
end





