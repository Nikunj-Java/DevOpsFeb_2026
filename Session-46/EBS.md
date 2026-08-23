# Elastic Block Storage (EBS)
- in this lab we will understand to Attach, Create, Format, Mount, Test, Unmount,Remove,Detach The AMAZON EBS Volume on an EC2 Linux Instance

# Step:1 Create AWS EC2 Instance
instance Details:
- EC2 instance: Linux
- Root Disk: 8GB
- Availability Zoni: us-east-1a (it should be same for all)

![EC2 Instance](images/image-1.png)

- wait till status checks completed to ```3/3 checks passed```
![alt text](images/image-2.png)

- Connect using AWS CLI
![alt text](images/image-4.png)

![alt text](images/image-3.png)
- Get the List of Available Disk
```
lsblk
```
![alt text](images/image-5.png)

## Step:2 Create Elastic Block Storage Volume(EBS Volume)
- Go to: left Navigation Menu> EBS> Volumes

![alt text](images/image-6.png)

- Click on ```Create Volume```
![alt text](images/image-7.png)

- Choose This Setting

    1. Volume Type: gp3
    2. Size: 1 Gib
    3. Availability Zone: us-east-1a (Must Be Same as your EC2 Instance)

![alt text](images/image-8.png)

![alt text](images/image-9.png)

![alt text](images/image-10.png)

## Step:3 Attach EBS Volume to EC2
__Note:__ Make Sure Your EC2 Instance and EBS volume Must be in a Same AZ's, if they are in different AZ, You Won't be able to Attach the Volume to EC2 Instance

- click on Volume > Action > Attach Volume
![alt text](images/image-11.png)

- choose your instance
![alt text](images/image-12.png)

- choose device name
![alt text](images/image-13.png)

- goto> EC2 Instance> Storage>
![alt text](images/image-14.png)

- scroll down and check the list of EBS, You will see the newly added EBS
![alt text](images/image-15.png)

- check using AWS CLI
```
lsblk
```
![alt text](images/image-16.png)

## Step:4 Format the EBS Volume

- Format it with ```ext4``` filesystem:
```
sudo mkfs -t ext4 /dev/nvme1n1
```
![alt text](images/image-17.png)

verify the Filesystem
```
lsblk -f
```

![alt text](images/image-18.png)

## Step:5 Create a Mount Point
- Create a directory called ```/data```

```
sudo mkdir /data
```

- Mount The EBS Volume

```
sudo mount /dev/nvme1n1 /data
```
- verify the mount with:
```
df -h
```
![alt text](images/image-19.png)

- output
```
/dev/nvme1n1      974M   24K   907M   1%   /data
```

## Step:6 Test the EBS Volume
- create a test file on the mounted EBS Volume
```
echo "Hello From EBS" | sudo tee /data/test.txt
```
- Read the file
```
cat /data/test.txt
```
![alt text](images/image-20.png)

## Step:7 Unmount Disk
```
sudo umount /data
```
Now Try to Read Data
```
cat /data/test.txt
```
Output:
```
cat: /data/test.txt: No such file or directory
```
## Step:8 Mount The Disk
```
sudo mount /dev/nvme1n1 /data
```
Now Try to Read Data
```
cat /data/test.txt
```