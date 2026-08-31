#!/bin/bash

# Simple Interest Calculator

echo "-----------------------------------"
echo "    Simple Interest Calculator     "
echo "-----------------------------------"

# Prompt the user for input fields
read -p "Enter the principal amount: " principal
read -p "Enter the annual rate of interest (in %): " rate
read -p "Enter the time period (in years): " time

# Validate that inputs are numbers
if [[ ! $principal =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   [[ ! $rate =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   [[ ! $time =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: All inputs must be positive numbers."
    exit 1
fi

# Calculate Simple Interest using 'bc' for floating-point math
# Formula: SI = (P * R * T) / 100
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate Total Amount
total_amount=$(echo "scale=2; $principal + $interest" | bc)

echo "-----------------------------------"
echo "Results:"
echo "Interest Earned: $interest"
echo "Total Balance:   $total_amount"
echo "-----------------------------------"
