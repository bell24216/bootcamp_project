pmenu = function(){
  print("you choose view menu pizza")
  print("1.Ham and Cheese 299฿ ,2.Crabstix Hawaiian 199฿, 3.Super Bacon 324฿ ")
    print("choose your menu")
    q3= readLines("stdin",n=1)
    if (q3 == 1 ){
      print("you choose Ham and Cheese 299฿")
      delivery()
    } else if (q3 == 2 ) {
      print("you choose Crabstix Hawaiian 199฿")
      print("sorry out of stock")
      print("try anoter meun ")
      pmenu()
    } else {
      print("you choose Super Bacon 324฿")
      delivery()
    }
}
delivery = function(){
      print("do want to 1.delivery or 2.walk in")
      q5= readLines("stdin",n=1)
      if (q5 == 1 ){
        print("okay we will coming soon")
      } else{ 
        print("we will waiting for you")        
      }
 }


print("Welcome to our app")
print("Hello There!")
print("What is your name?")
uname = readLines("stdin",n=1)
print(paste("Hi" , uname))
print("What do you want to order today?")
print("1.order pizza , 2.call center")
q1 = readLines("stdin",n=1)
if (q1 ==1) {
    print("you choose order pizza")
  print("choose your choice")
  print("1.view menu pizza ,2.view promotion")
  q2= readLines("stdin",n=1)
  if (q2 == 1) {
    pmenu()
  } else{
    print("you choose view promotion")
    print("Set A:Ham and Cheese And Spicy Tom Yum Seafood Spaghetti it only 350฿")
    print("do you went Set A?")
    print("1.Yes ,2.view menu pizza")
    q4= readLines("stdin",n=1)
    if (q4 == 1 ) {
    delivery()
    }else{
      pmenu()
    }
  }
} else{
  print("you choose call center")
}