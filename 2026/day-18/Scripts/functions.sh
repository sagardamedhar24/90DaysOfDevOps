#!/bin/bash
# Creating function that takes name as an argument and prints it.
# Creating another function for adding two numbers.
# Calling both funtions

# --- Creating Functions ----

function greet() {
echo "Hello, $1!"

}

function add() {

num1=$1
num2=$2
sum=$((num1+num2))
echo "The sum of two numbers $num1 & $num2 is : $sum" 

}

# --- Calling Function --- 
greet "Sagar"
add 5 10
