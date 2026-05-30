from selenium import webdriver

driver= webdriver.Chrome()
driver.get("https://www.pw.live/")
assert "Physics wallah Live Courses" in driver.title
#print("Title Tested Succeffully")
driver.quit()