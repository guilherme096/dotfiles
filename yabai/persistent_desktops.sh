#! /bin/bash

echo "Labeling  spaces..."
for space_index in {1..10}
do
  yabai -m space $space_index --label "space_$space_index"
done
