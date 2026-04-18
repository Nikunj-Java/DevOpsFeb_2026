input="+919876543210"

if [[ $input =~ ^\+91[6-9][0-9]{9}$ ]]; then
    echo "Valid Indian Mobile Number"
else
    echo "Invalid Mobile Number"
fi