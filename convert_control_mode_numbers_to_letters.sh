#!/bin/bash

: '
to-do figure out a bash dictionary
0 ---
1 --x
2 -w-
3 -wx
4 r--
5 r-x
6 rw-
7 rwx
'

control_mode=${1}
if [[  0 = "${control_mode}" ]]; then
  echo "---"
elif [[ 1 = "${control_mode}" ]]; then
  echo "--x"
elif [[ 2 = "${control_mode}" ]]; then
  echo  "-w-"
elif [[ 3 = "${control_mode}" ]]; then
  echo "-wx"
elif [[ 4 = "${control_mode}" ]]; then
  echo "r--"
elif [[ 5 = "${control_mode}" ]]; then
  echo "r-x"
elif [[ 6 = "${control_mode}" ]]; then
  echo "rw-"
elif [[ 7 = "${control_mode}" ]]; then
  echo "rwx"
fi