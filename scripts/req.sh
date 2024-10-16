#!/usr/bin/bash

for num in {1..100}
do
  echo "$num: $(curl -sS localhost:3000 | jq '.')" &
done

wait  # Waits for all background jobs to finish
