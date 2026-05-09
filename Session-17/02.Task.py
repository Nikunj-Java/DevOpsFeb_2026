import os,shutil,smtplib
from datetime import datetime
from email.mime.text import MIMEText

def check_logs(filepath):
    errors=[]
    with open(filepath,"r") as f:
        for line in f:
            if "ERROR" in line: 
                errors.append(line.strip())
        return errors
    
def backup_data(source,backup_dir):
    #source="/mnt/d/important_data" #for windows use: "D:/test_folder"
    #backup_dir="/mnt/d/backups" # for windows use: "D:/backups"
    timestamp=datetime.now().strftime("%Y%m%d%H%M%S")
    backup_file=os.path.join(backup_dir,f"backup_{timestamp}.zip")
    shutil.make_archive(backup_file.replace('.zip',''),'zip',source)
    return backup_file

def send_email(subject,body):
    sender_email="ganitniduniyanikunj10@gmail.com"
    receiver_email="ganitniduniyanikunj10@gmail.com"
    password="jqbz kvfy bwpw pxdi" # use an app password if 2FA is enabled
     #goto>https://myaccount.google.com/
    #select >security> enable 2 step-verification
    #goto> search bar> app password>

 
    msg=MIMEText(body)
    msg["Subject"]=subject
    msg["From"]=sender_email
    msg["To"]=receiver_email

    with smtplib.SMTP("smtp.gmail.com",587) as server:
        server.starttls() #encrypt the connection
        server.login(sender_email,password)
        server.send_message(msg)



# run automation
errors= check_logs("system.log")
if errors:
    backup_path=backup_data("/mnt/e/important_data","/mnt/e/backups")
    #backup_path = backup_data("E:/important_data", "E:/backups")
    send_email("! Error Detected- Backup Done",f"Errors:\n {chr(10).join(errors)}\n Backup: {backup_path}")
    print("Task Done with Error Notification")
else:
    print("No Errors Detected")