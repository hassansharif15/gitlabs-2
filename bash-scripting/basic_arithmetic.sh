#!/bin/bash
# A simple arithmetic calculator

read -p "Enter first number: " num1
read -p "Enter second number: " num2

echo "Addition: $((num1 + num2))"
echo "Subtraction: $((num1 - num2))"
echo "Multiplication: $((num1 * num2))"
echo "Division: $((num1 / num2))"

