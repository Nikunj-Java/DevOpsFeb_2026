from datetime import datetime

#1 using strftime f=formatting
now=datetime.now()
print("Date:",now)

#2 Formate the date time
formatted= now.strftime("%Y-%m-%d %H:%M:%S")
print("Formatted Date: ",formatted)
#print(f"Formatted Date: {formatted}")

#3 using strptime p=parsing convert the string format into date time
date_str="2026-05-25 16:19:43"
parsed=datetime.strptime(date_str,"%Y-%m-%d %H:%M:%S")
print("Parsed Datetime:",parsed)