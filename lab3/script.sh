#!/bin/bash

header=header.txt
body=body.txt
footer=footer.txt
resultfile=results.csv
codefile=tmp.cpp

if [ -f $codefile ]; then
  cat /dev/null >$resultfile
  cat /dev/null >$body

  for ((i = 1; i <= 10; i++)); do
    cat /dev/null >$codefile

    printf "\n\t\tif (i < 0) {\n \t\t\ta = 0; \n\t\t}\n" >>$body

    cat $header >>$codefile
    cat $body >>$codefile
    cat $footer >>$codefile

    g++ tmp.cpp -o tmp -O0

    printf "$i\n" >>$resultfile

    for ((k = 3; k <= 100; k++)); do
      printf "$k," >>$resultfile
      ./tmp $k >>$resultfile
      printf "\n" >>$resultfile
    done
  done
fi
