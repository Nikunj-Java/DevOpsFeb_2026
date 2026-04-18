declare -A user_info
user_info["name"]="Naveen"
user_info["age"]=30
user_info["city"]="Pune"

# echo "Name: ${user_info["name"]}"
# echo "Age: ${user_info["age"]}"
# echo "City: ${user_info["city"]}"

for key in "${!user_info[@]}"; do
    echo "$key: ${user_info[$key]}"
done