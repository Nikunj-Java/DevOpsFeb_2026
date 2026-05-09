import smtplib
from email.mime.text import MIMEText

def send_email(subject,body):
    sender_email="youremail@gmail.com"
    receiver_email="receiveremail@gmail.com"
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

send_email("Backup Completed","Backup Created Successfully")