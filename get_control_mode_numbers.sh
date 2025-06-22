#!/bin/bash

# there are easier ways to do this with stat, but stat isn't implemented the same on mac and linux

file_name=${1}

# the stat command returns a bunch of extra information
read -ra array <<< "$(stat "${file_name}")"
# the control mode information in in string format under index 2
control_modes="${array[2]}"

# divide the control_modes into local, group, and other substrings
local_control_modes="${control_modes:1:3}"
group_control_modes="${control_modes:4:3}"
other_control_modes="${control_modes:7}"

# convert each substring and return it as 1 three digit number
echo "$(./convert_control_mode_letters_to_numbers.sh "${local_control_modes}")""$(./convert_control_mode_letters_to_numbers.sh "${group_control_modes}")""$(./convert_control_mode_letters_to_numbers.sh "${other_control_modes}")"