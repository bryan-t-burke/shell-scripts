#!/bin/bash

# take the first command line argument and make the first letter capital
# using ^ to upper case letter isn't available before bash 4 so we'll do it using tr

# argument $1 substring starting at index 0 and including 1 character
first=$(echo "${1:0:1}" | tr "[:lower:]" "[:upper:]")
# argument $1 substring starting at index 1 and going to the end of the value
rest=${1:1}

echo "$first""$rest"
