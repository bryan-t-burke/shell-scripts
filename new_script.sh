#!/bin/bash

# starts a new script with #!/bin/bash so I don't have to look up the line every time
# also sets local user read, write, and execute
# $1 new script file name

file_name="${1}"

# we only care about file types that end in .sh
file_type=${1:(-3):3}

# if the new file name doesn't already end in .sh, append it
if [[ ".sh" != "${file_type}" ]]; then
  file_name=${1}".sh"
fi

# make the file
touch "${file_name}"
{
  # preload the bash version
  echo "#!/bin/bash"
  echo ""
} >> "${file_name}"

# set execute permissions
# to-do: make it less reliant on the directory structure
./set_local_read_write_execute.sh "${file_name}"
