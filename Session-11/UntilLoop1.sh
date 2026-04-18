# it will execute the loop until the condition is true, and it will check the condition after executing the loop body at least once.
# An Until loop runs until a condition becomes TRUE.
# Basic Syntax:

# until [ condition ]
# do
#     # commands to be executed
# done
# windows: D:/file.txt -> /mnt/d/file.txt

until [[ -f "/mnt/d/file.txt" ]]; do
    echo "File does not exist. Waiting..."
    sleep 5
done
echo "File exists. Continuing..."