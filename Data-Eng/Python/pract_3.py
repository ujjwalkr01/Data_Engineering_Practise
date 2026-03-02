def MovingZeroEnd(lst):
    indx=0
    for i in range(len(lst)):
        if lst[i]!=0:
            lst[indx],lst[i]=lst[i],lst[indx]
            indx+=1
   
    print(f"After shifting the list is :{lst}")        

def findMissingNum(lst):
    st=set(lst);
    maximum=max(st)

    for num in range (maximum+1):
        if num  not in st:
            return num

def checkAnagram(s1,s2):
    if len(s1) != len(s2):
        return False
    freq={}
    for char in s1:
        freq[char]=freq.get(char,0)+1
    
    for char in s2:
        if char in freq:
            freq[char]=freq.get(char,0)-1
        else:
            return False

    for key in freq:
        if freq[key]!=0:
            return False
    return True;
def main():
    s1=input("enter the string 1: ")
    s2=input('enter the string 2:')
    print(checkAnagram(s1,s2))
    lst=list(map(int,input("Enter the list value:").split()))
    #print(f"The missing number in the list is : {findMissingNum(lst)}")
    MovingZeroEnd(lst)

if __name__=="__main__":
    main();