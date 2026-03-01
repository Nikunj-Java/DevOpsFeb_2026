# How Paging Works?
- Process is divided into pages
- RAM is divided into frames
- OS Load pages in any free frame
- A page Table store mapping (Page Number = Frame Number)
- CPU generate logical address
- MMU (Memory Management Unit) converts into Physical Address

# What is Page Size?
- Page size= Frame Size (Commonly in 4KB)

# Why Paging is needed?
- it will solve Non-Contiguos memory allocation
- Better RAM Utilization

# What if we will not use Paging?
- Program needs continuous fragmentation
- Leads to external Fragmentation
- Leads to fail a program

# Logical Address in Paging
- CPU generates Logical address, which has two parts
``` 
    logical address = (page number, offset)
```
- Example
    - page size = 4 KB = 4 * 2^10 Bytes = 4096 bytes 
    - Logical Address = 8196
```
    Page Number= 8196/4096 = 2
    offset= 8196 % 4096 =4
```
# Page Table
- page Number -----> Frame 4

                Page No        |           Frame No
                  0            |            5      
                  1            |            9
                  2            |            3
                  3            |            2
- conclusion: Page 2 is stored in Frame 3