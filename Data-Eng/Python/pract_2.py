def secLargest(lst):
    large=lst[0]
    sLarge=-1
    
    for el in lst:
        if large < el:
            sLarge=large
            large=el
        elif sLarge<el<large:
            sLarge=el

    print(f"The second largest number in the list is {sLarge}")
 

def removeDup(lst):
    res=[]
    for el in lst:
        if el not in res:
            res.append(el)
    print(res);
def firstNonRepeat(wrd):
    freq={}
    for char in wrd:
        freq[char]=freq.get(char,0)+1
    
    for char in wrd:
        if freq[char]==1:
            return char
    
    return -1
def cntFrequency(lst):
    freq={}
    for el in lst:
        freq[el]=freq.get(el,0)+1
    
    for key,val in freq.items():
        print(f"{key}--{val}")
def main():
    lst=list(map(int,input("Enter the numbers").split()))
    print(lst)
    #cntFrequency(lst)
    word="abaabdcdef"
    res=firstNonRepeat(word)
    if res==-1:
        print(f"There is no non repeating character in the string")
    else:
        print(f"The first non repeating character in the string is {res}")

    removeDup(lst)
    secLargest(lst)     

if __name__=="__main__":
    main();

   