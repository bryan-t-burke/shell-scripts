#!/bin/bash

# take the first command line argument and make all the letters lower case
echo "${1}" | tr "[:upper:]" "[:lower:]"