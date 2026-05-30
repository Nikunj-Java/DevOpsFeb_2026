from selenium import webdriver
from selenium.webdriver.common.by import By

driver= webdriver.Chrome()
driver.get("https://www.gmail.com/")
#print("Title Tested Succeffully")
#name= driver.find_element(By.NAME,"identifier")
name= driver.find_element(By.ID,"identifierId")
name.send_keys("nikunj@gmail.com")