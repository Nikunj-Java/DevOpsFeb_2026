import os
print (os.listdir("."))

# create and write data
with open("test_file.txt","w") as file:
    file.write("This is a test file")

# Read file content
with open("python installation guide.txt","r") as f:
    content=f.read()
    print(content)

# update file (append data)
with open("test_file.txt", "a") as f:
    f.write("Adding new line to update the file.\n")


# os.remove("test_file.txt")
# print("File is Removed")
