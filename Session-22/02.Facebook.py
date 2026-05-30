from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By

driver = webdriver.Chrome(
    service=Service(ChromeDriverManager().install())
)
driver.get("https://facebook.com/")

email= driver.find_element(By.NAME,"email")
#assert email.is_displayed()
#print("Email Field Required")
email.send_keys("test@gmail.com")

password= driver.find_element(By.NAME,"pass")
#assert password.is_displayed()
#print("Password Field Required")
password.send_keys("password@1123")

button= driver.find_element(By.XPATH,'//*[@id="login_form"]/div/div[1]/div/div[3]/div/div/div')
button.click()

input("Press Enter to close the browser...")

#driver.quit()