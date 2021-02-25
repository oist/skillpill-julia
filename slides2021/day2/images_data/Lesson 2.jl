# load Statistics package for mean and median calculations
using Statistics

#=
Example code
Generates a random array and uses it to simulate coin flips 
=#

randflips = rand(10);
heads = sum(randflips.>0.5)./length(randflips);
println("Heads percentage is: ",floor(heads*10000)/100,"%" )



#=
Exercise 1

Creates a file 'squares.txt' consisting of the first 5 square numbers
=#



#=
Exercise 2

Write a script which creates a new file called large_cities.txt.
The file should contain one line for each of the cities  which have a
population larger than 10,000,000., formatted as follows:
    Buenos Aires, Argentina: ?population 11862073
    Sao Paulo, Brazil: population 14433147.5
    ...
=#



#=
Exercise 3

Read data.txt given in the Public Folder and plot the results.
What do you see?

=#

#=
Exercise 4
	Plot a histogram of the longitudes of the world's cities. What is the mean and median longitude?
=#