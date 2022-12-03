print("Welcome to Rock paper scissors")

win = 0
lose = 0
tie = 0
count = 0

while (count==0) {
  bot = sample(c("rock","paper","scissors"),1)
  print("select (1)rock, (2)paper, (3)scissors, (4)quit game")
  p1 = readLines(con="stdin",n=1)
  if (p1==1){
    print("Your Rock")
  }else if (p1==2){
    print("Your Paper")
  }else if (p1==3){
    print("Your Scissors")
  }else if (p1==4){
    print("exit game")
  }
  if ((p1==1) | (p1==2) | (p1==3)){
    print(paste("Bot",bot))
  }
  
  if (((p1==1 & bot == "scissors")|
       (p1==2 & bot =="rock")|
       (p1==3 & bot == "paper"))
          & (p1!=4)){
    print("You win")
    win=win+1
          }
  else if (((p1 ==1 & bot == "rock")|
           (p1==2 & bot =="paper")|
           (p1==3 & bot == "scissors"))
          & (p1!=4)){
    print("Tie")
    tie=tie+1
          }
  else if (((p1 ==1 & bot == "paper")|
           (p1==2 & bot =="scissors")|
           (p1==3 & bot == "rock"))
          & (p1!=4)){
    print("You lose")
    lose=lose+1
          }
  if (p1==4){
    re=data.frame(win,lose,tie)
    print("Score:")
    print(re)
    break
  }


}