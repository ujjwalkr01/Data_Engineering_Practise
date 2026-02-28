"""print("Welcome to python programming");
print("Hello world");
print("My name is Ujjwal");

name=input("Enter your name");
print(name);"""

#------------------

def printNum(num):
    for el in range(1,num+1):
        print(el)

if __name__== "__main__":
    num=int(input("Enter the number: "))
    printNum(num)

#---print even number:
def checkEvn_odd(num):
    if num%2==0:
        return True;
    else:
      return False;

if __name__=="__main__":
    num=int(input("Enter the number to check even or odd: "))
    print(checkEvn_odd(num));
       
#------sum of number:

def printSum(num):
    sum=0
    for el in range(1,num+1):
        sum+=el

    return sum;

if __name__=="__main__":
    num=int(input("Enter the number n:"))
    print("The sum of n numbers is: ",printSum(num))    
