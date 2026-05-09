import unittest
from main import add,subtract,multiply

class TestMain(unittest.TestCase):
    def test_add(self):
        assert add(2,3) == 5
        assert add(-1,1) == 0
        
    def test_subtract(self):
        assert subtract(10, 5) == 5
        assert subtract(10, 10) == 0

    def test_multiply(self):
        assert multiply(10, 5) == 50
        assert multiply(2, 3) == 6