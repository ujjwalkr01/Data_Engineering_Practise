def frequency(lst):
    """lst.sort();
    print(lst);
    num=lst[0]
    cnt=0
    for el in lst:
        if num==el:
            cnt+=1
        else:
            print(f"{num}-->{cnt}")
            num=el
            cnt=1
    print(f"{num}-->{cnt}")"""

    freq={}

    for el in lst:
        freq[el]=freq.get(el,0)+1

    for key,val in freq.items():
        print(f"{key}-->{val}");
def findLargest(lst):
    largest=lst[0]
    for el in lst:
        if largest<el:
            largest=el
    print(f"the largest number from the {lst} is: {largest}");        
def revString(word):
    rev=""
    for char in word:
        rev=char+rev;
    print(f"the reverse of the string is: {rev}");
def countVowels(vow):
    cnt=0
    for ch in vow:
        if ch in "aeiou":
            cnt+=1
        
    print(f"Total number of vowels peresent in {vow} is: {cnt}");
def printFactorial(num):
    res=1;
    for el in range(2,num+1):
        res*=el
    print(f"The factorial of {num} is: {res}");       
def main():
    num=int(input("Enter the number: "))
    printFactorial(num)
    word="ujjwal"
    countVowels(word)
    revString(word)
    lst=[4,-5,7,8,1,12,15,6]
    findLargest(lst);
    lst1=[1,3,2,3,2,3,1];
    frequency(lst1);

if __name__=="__main__":
    main();