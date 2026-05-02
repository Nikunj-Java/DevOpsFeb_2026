import requests
url="https://jsonplaceholder.typicode.com/users/1"
response=requests.get(url)

print("Status Code:", response.status_code) # 200: OK, 404: Not Found, 500: Internal Server Error
print("Headers:", response.headers)
print("Content:", response.text)
