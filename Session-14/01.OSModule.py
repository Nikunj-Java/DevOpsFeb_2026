import os
import shutil

path="D:\\" if os.name =="nt" else "/mnt/d"

total,used,free=shutil.disk_usage(path)

def to_gb(bytes_value):
    return bytes_value // (1024**3)
    #To convert bytes to gigabytes, divide the number of bytes by
    #1,073,741,824 (1024³). 

# printing the value
print(f"OS Name: ${os.name}")
print(f"Checking disk usage for:{path}")
print(f"Total:",to_gb(total),"GB")
print(f"Used:",to_gb(used),"GB")
print(f"Free",to_gb(free),"GB")
