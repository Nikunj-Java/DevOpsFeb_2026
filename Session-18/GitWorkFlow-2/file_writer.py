def write_to_file(filename,content):
    with open(filename,"w") as f:
        f.write(content)

if __name__ == "__main__":
    write_to_file("output.txt","Hello From Github Action")
    print("File Created and Content Written Successfully!")

    # when you run python3 app.py or python app.py
    # then __name__ becomes "__main__" so the code inside will run