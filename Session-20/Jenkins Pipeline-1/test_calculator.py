from calculator import add,subtract,multiply,divide

def test_add():
    assert add(2,4) == 6

def test_subtract():
    assert subtract(10,6) == 4

def test_multiply():
    assert multiply(3,2) == 6

def test_divide():
    assert divide(20,4) == 5