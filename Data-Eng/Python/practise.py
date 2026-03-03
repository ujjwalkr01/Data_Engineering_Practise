def checkEvenOdd():
     with open("D:/Courses/Data-Eng/Python/Numbers.txt","r") as f:
          data=f.read()
          nums=data.split(",")
          print(nums)
          cnt=0
          for val in nums:
               if int(val)%2==0:
                    cnt+=1
          
          print(cnt)
                    
                        
def checkWordLine():
     word="programming"
     lineNo=1
     data=True

     with open("D:\Courses\Data-Eng\Python\practise.txt","r") as f:
          while data:
               data=f.readline()
               if word in data:
                    return lineNo
               lineNo+=1
     return -1               
          
def checkWord():
     word="learnings"
     with open("D:\Courses\Data-Eng\Python\practise.txt","r") as f:
          data=f.read()
          if(data.find(word)!=-1):
               print("found")
          else:
               print("not found")    

def replace_word():
    with open("D:\Courses\Data-Eng\Python\practise.txt","r") as f:
         data=f.read()
         new_data=data.replace("Java","Python")
         print(new_data)

    with open("D:\Courses\Data-Eng\Python\practise.txt","w") as f:
         f.write(new_data)  

def main():
     replace_word()
     checkWord()
     if(checkWordLine()!=-1):
          print(f"The word is first present in the file at line {checkWordLine()}")
     else:
          print(f"The word is not persent in the file")   

     checkEvenOdd()       


if __name__=="__main__":
     main()