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
if [[ "---" = "${control_mode}" ]]; then
  echo 0
elif [[ "--x" = "${control_mode}" ]]; then
  echo 1
elif [[ "-w-" = "${control_mode}" ]]; then
  echo 2
elif [[ "-wx" = "${control_mode}" ]]; then
  echo 3
elif [[ "r--" = "${control_mode}" ]]; then
  echo 4
elif [[ "r-x" = "${control_mode}" ]]; then
  echo 5
elif [[ "rw-" = "${control_mode}" ]]; then
  echo 6
elif [[ "rwx" = "${control_mode}" ]]; then
  echo 7
fi
