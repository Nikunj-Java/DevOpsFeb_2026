# Associative Array
```
An Associative Array stores data in Key-> Value Format (not index based)
```
Normal Array
```
fruits[0]="apple"
fruits[1]="banana"
fruits[2]="mango"
```
Associative Array
```
students[name]="Nikunj"
students[city]="Mumbai"
Here name, city -> Keys
     "Nikunj","Mumbai"-> Values
```
## How to Declare it ?
```
declare -A student
```
- Here 'A' Means associative array
## How to Add Values ?
```
student[name]="Nikunj"
student[age]=25
studnet[city]="Mumbai"
```

## How to Access ?
```
echo "${student[name]}"
echo "${student[city]}"
```

## How to Iterate ?
```
for key in "${!student[@]}"; do
    echo "$key: ${student[$key]}"
done
```
- Here '${!student[@]}' means Get All Keys
- if you want to get length of an array
```
${#student[@]}
```
- if you want to get all values
```
${student[@]}
```