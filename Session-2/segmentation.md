# What is Segmentation ?
- it is Memory Management Technique where a program is divided into variable logical parts instead of fixed size blocks

# Why it is needed ?
- Paging is good for memory usage but:
    - it ignores program structure
    - programmers think in logical parts not pages
- Segamentation solves by 
    - Matching the Program Logic(How Programmer Think)
    - Support Protection of the program and sharing
    - better program organization
# How it is working ?
- find logical unit of program by segment number
- in segmentation CPU Generate Logical Address
    - Logical Aaadress =(Segment Number, Offset)
    - eg : (2, 400)
- it will be maintain in Segment Table
- it will convert into Physical Address

