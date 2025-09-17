#!/bin/bash
# menu_arithmetic.sh

# Ask for input
echo "Enter first number:"
read num1

echo "Enter second number:"
read num2

# Show menu
echo ""
echo "Choose an operation:"
echo "1) Addition"
echo "2) Subtraction"
echo "3) Multiplication"
echo "4) Division"
read -p "Enter choice [1-4]: " choice

# Perform selected operation
case $choice in
    1)
        result=$((num1 + num2))
        echo "Result: $num1 + $num2 = $result"
        ;;
    2)
        result=$((num1 - num2))
        echo "Result: $num1 - $num2 = $result"
        ;;
    3)
        result=$((num1 * num2))
        echo "Result: $num1 * $num2 = $result"
        ;;
    4)
        if [ $num2 -ne 0 ]; then
            result=$((num1 / num2))
            echo "Result: $num1 / $num2 = $result"
        else
            echo "Error: Division by zero is not allowed!"
        fi
        ;;
    *)
        echo "Invalid choice!"
        ;;
esac

