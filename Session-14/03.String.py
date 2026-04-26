message=" Hello Devops World! "

#1. Remove leading and Trailing Spaces
print("1. strip():",message.strip())

#2. Convert to uppercase
print("2. upper():",message.upper())

#3. Covert to lowercase
print("3. lower():",message.lower())

#4. Replace the word
print("4. replace():",message.replace("Devops","Python"))

#5. check if string start with a word
print("5. startsWith('Hello'):",message.strip().startswith("Hello"))

#6. check if string end with a word
print("6. endsWith('World!'):",message.strip().endswith("World!"))

#7. find the position of substring
print("7. find('Devops'):",message.find("Devops"))

#8. cont how many times a word appears
print("8. count('o'):",message.count('o'))
print("8. count('l'):",message.count('l'))

#9. Split the string into a list(array)
words=message.strip().split(" ")
print("9. split():",words)

#10. join the list back into a string with "-"
print("10. join():","-".join(words))

#11. check all character are alphabets
print("11. isalpha():","Hello123".isalpha())
print("11. isalpha():","Hello".isalpha())

#12. check that string contains only digits
print("12. isdigit():","12345678".isdigit())
print("12. isdigit():","12345678QWERTY".isdigit())