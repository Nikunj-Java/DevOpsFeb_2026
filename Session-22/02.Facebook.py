from selenium import webdriver
from selenium.webdriver.common.by import By

driver= webdriver.Chrome()
driver.get("https://facebook.com/")

email= driver.find_element(By.NAME,"email")
#assert email.is_displayed()
#print("Email Field Required")
email.send_keys("test@gmail.com")

password= driver.find_element(By.NAME,"pass")
#assert password.is_displayed()
#print("Password Field Required")
password.send_keys("password@1123")



#driver.quit()