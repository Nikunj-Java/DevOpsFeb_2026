import os
from file_writer import write_to_file

def test_write_to_file():
    test_filename="test_output.txt"
    test_content="Test Content For CI"
    write_to_file(test_filename,test_content) # calling file_writer.py's write_to_file method for creating New File and Content

    assert os.path.exists(test_filename),"File was not created!" # using Assert we are checking Filepath Exist or not

    with open(test_filename,"r") as f:
        content=f.read()
        assert content==test_content,"File Content Do Not Match!" # using Assert wenare checking the content Written and Actual Content are same or not
