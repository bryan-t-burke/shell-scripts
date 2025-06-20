#!/bin/bash

# starts a new script with #!/bin/bash so I don't have to look up the line every time
# also sets local user read, write, and execute
# $1 new script file name

# to-do: add check for if $1 already ends with .sh

touch "$1.sh"
{
  echo "#!/bin/bash"
  echo ""
} >> "$1.sh"

# to-do: won't work if the set_local_read_write_execute.sh script isn't in the same directory
./set_local_read_write_execute.sh "$1.sh"
