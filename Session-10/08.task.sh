#!/bin/bash
BASE_DIR="data"

mkdir -p $BASE_DIR

# loop to create random folders and files
for i in {1..5}
do
    DIR="$BASE_DIR/folder_$i"
    mkdir -p $DIR

    # create random number of files 
    for j in {1..3}
    do 
        FILE="$DIR/file_$j.txt"
        # write random data to the file
        echo "Random Number: $RANDOM" > $FILE
        echo "Created $FILE"
    done
done

echo "All folders and files created in $BASE_DIR directory."
