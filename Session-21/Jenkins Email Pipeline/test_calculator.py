from calculator import add, subtract, multiply, divide

def test_add():
    assert add(2, 3) == 5

def test_subtract():
    assert subtract(10, 5) == 5

def test_multiply():
    assert multiply(4, 5) == 20

def test_divide():
    assert divide(20, 4) == 5