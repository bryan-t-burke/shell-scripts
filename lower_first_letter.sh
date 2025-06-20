#!/bin/bash

# take the first command line argument and make the first letter capital
# using ^ to upper case letter isn't available before bash 4

# take a 1 character substring of the first command line argument
first=$(echo "${1:0:1}" | tr "[:upper:]" "[:lower:]")
# argument $1 substring starting at index 1 and going to the end of the value
rest=${1:1}

echo "$first""$rest"
