import pytest
from PythonProject.app.calculator import add, subtract, divide, multiply

def test_add():
    assert add(2, 4) == 6

def test_subtract():
    assert subtract(10, 6) == 4

def test_divide():
    assert divide(20, 10) == 2

def test_multiply():
    assert multiply(3, 6) == 18

def test_divide_by_zero():
    with pytest.raises(ValueError):
        divide(10, 0)