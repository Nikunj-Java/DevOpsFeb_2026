# Selenium Uninstallation
```
python3 -m pip show selenium
```
- If installed, you'll see package details.

## Uninstall Selenium
```
python3 -m pip uninstall selenium --break-system-packages
```
- When prompted:
- Type
```
y
```
## verify the Selenium Removal
```
python3 -m pip show selenium
```
- You should get something like:
```
WARNING: Package(s) not found: selenium
```
- check whether selenium was installed via ubuntu package
```
dpkg -l | grep selenium
```
```
sudo apt remove python3-selenium
```

# Selenium Latest Update
## Install Selenium
```
python3 -m pip install selenium --break-system-packages
```
- verify:
```
python3 -c "import selenium; print(selenium.__version__)"
```
- Expected output:
```
4.XX.X
```
## Install WebDriverManager
```
python3 -m pip install webdriver-manager --break-system-packages
```
- verify:
```
python3 -c "import webdriver_manager; print('webdriver-manager installed')"
```
## Verify Browser
```
google-chrome --version
```
 or
```
google-chrome-stable --version
```
## Run Test Script
```
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

driver = webdriver.Chrome(
    service=Service(ChromeDriverManager().install())
)

driver.get("https://www.google.com")

print("Title:", driver.title)

driver.quit()
```
- run using python3
```
 python3 scripname.py
```

# Task: Automate the given website
- link:
```
https://demoqa.com/automation-practice-form
```
or 
```
https://automationexercise.com/login
```
## what this script demonstrates
 - open browser
 - Enter text
 - Submit form
## Solution
```
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import time

options = Options()
options.add_experimental_option("detach", True)

driver = webdriver.Chrome(options=options)

driver.maximize_window()

driver.get("https://demoqa.com/automation-practice-form")

# First Name
driver.find_element(By.ID, "firstName").send_keys("Nikunj")

# Last Name
driver.find_element(By.ID, "lastName").send_keys("Soni")

# Email
driver.find_element(By.ID, "userEmail").send_keys("nikunj@gmail.com")

 
# Mobile Number
driver.find_element(By.ID, "userNumber").send_keys("9876543210")

 
time.sleep(2)
```