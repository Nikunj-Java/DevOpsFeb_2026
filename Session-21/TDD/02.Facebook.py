from selenium import webdriver

def open_browser():
    driver= webdriver.Chrome()
    driver.get("https://www.facebook.com/")
    title=driver.title
    print(title)
    driver.quit()
    
open_browser()