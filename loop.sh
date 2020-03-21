#!/bin/bash

for nthread in {1..12} ; do
  vector=$(( 1000000 / "${nthread}" ))
  for reps in 2000 ; do
    pad=$(printf '%*s' "$(tput cols)" "")
    pad=${pad// /.}
    parameters=$(printf "Number of threads: %.2d, Vector size: %.7d, Number of Repetitions: %d " $nthread $vector $reps)
    printf '%s' "$parameters"
    sum=0
    # shellcheck disable=SC2034
    for i in {1..10} ; do
      sum=$(( sum + $(./cmake-build-wsl/openmp $nthread $vector $reps) ))
      printf "."
    done
    result=$(printf " %d usec" "$(( "$sum" / 10 ))")
    printf '%*.*s' 0 "$(( $(tput cols) - ${#parameters} - ${#result} - 10))" "$pad"
    printf '%s\n' "$result"
  done
done
