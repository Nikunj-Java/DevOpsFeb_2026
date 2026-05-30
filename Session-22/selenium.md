# Selnium Installation
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