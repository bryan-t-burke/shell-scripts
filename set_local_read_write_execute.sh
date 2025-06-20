#!/bin/bash

: "
set local user read, write, and execute on a file while removing all three from group and other
chmod permissions use binary addition to set multiple conditions with a single number.
1: execute
2: write
4: read
Any combination of these 3 numbers will yield a unique result that determines what you can do with a file.
examples:
  3 (execute and write)
  5 (execute and read)
  6 (write and read)
  7 (execute, write, and read)

permissions can be set for local users, groups, and others in that order. Most of the time you'll probably only be working with local users
examples:
  700 is read, write, and execute for local users and nothing for anyone else
  777 is read, write, and execute for everyone
  040 is read only for groups and no one else.
"

# $1 is the name of the file we are updating, no other parameters are used
chmod 700 "$1"
