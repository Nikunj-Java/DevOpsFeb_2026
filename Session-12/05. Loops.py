# For in Loop
for i in range(1,10):
    print(f"Checking Server {i}....")

# While Loop
server_up= False
while not server_up:
    print("Waiting for the server  to start...")
    server_up = True # condition to break the loop
print("Server is up and running!")

# while loop
i = 1
while i<=10:
    print(f"Checking Server {i}....")          
    i+=1


# while loop
j =10

while j<=20:
    if j == 25:
        print("Server 25 is up and running!")
        break
    j+=1