f=open("D:\Courses\Data-Eng\Python\demo.txt","r")

#read()--reads the file at a time.  also we can pass the number as arguments and can get the set of character from first. 
data=f.read()
print(data)
print(type(data))
f.close()
# readline()-- reads one line at a time.also by default it takes \n that means switch to next line
# Also whenever we use readline() after read() we wont see anything printed as the read() reads the file at once so the pointer will be at end of the file and so why we see that empty space is printed.
#If we want to use readline() after read() we should close the file first and then we can use readline()
f=open("D:\Courses\Data-Eng\Python\demo.txt","r")
data1=f.readline()
print(data1)
f.close()

#----write()-----
#open(filename,w) is used to overwrite the file and if the file is not present it creates and new file and writes the files.
f=open("D:\Courses\Data-Eng\Python\demo1.txt","w")
f.write("I will definetly get prepared for a job switch within a month. No matter whatever it takes")
f.close()

f=open("D:\Courses\Data-Eng\Python\demo1.txt","a")
f.write("\nJust stay focused and be consistent")
f.close()

#--with syntax:
#it's will auto close the file once the block ends
with open("D:\Courses\Data-Eng\Python\demo1.txt","r") as f:
    data=f.read()
    print(data)

with open("D:\Courses\Data-Eng\Python\demo1.txt","w") as f:
    f.write("HI I'm Ujjwal kumar")
 
#Deleting the file:----
# we can delete the file with the help of os module using remove()
import os
os.remove("D:\Courses\Data-Eng\Python\demo1.txt")