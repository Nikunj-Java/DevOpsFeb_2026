from selenium import webdriver

def open_browser():
    driver= webdriver.Chrome()
    driver.get("https://www.google.com/")
    
open_browser()