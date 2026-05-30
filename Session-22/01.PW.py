from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

driver = webdriver.Chrome(
    service=Service(ChromeDriverManager().install())
)
driver.get("https://www.pw.live/")
assert "Physics wallah Live Courses" in driver.title
#print("Title Tested Succeffully")
driver.quit()