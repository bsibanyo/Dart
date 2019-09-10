import 'dart:math';
import 'dart:io';

/*
  Get a player move via keyboard input
  If the player does not enter a valid selection between:
  (R)ock, (P)aper, or (S)cissors,
  The game will "Quit"
*/

String getPlayerMove(){
  print("Would you like (R)ock, (P)aper, or (S)cissors?");
  String selection =  stdin.readLineSync().toUpperCase();


  switch(selection){
    case "R":
      return "Rock";
      break;
    case "P":
      return "Paper";
      break;
    case "S":
      return "Scissors";
      break;
    default:
      return "Quit";
      break;
    }
}

/* 
  Return a random move in the form of a string of either
  (R)ock, (P)aper, or (S)cissors
*/

String getcomputerMove(){
  Random rand = new Random();
  int move = rand.nextInt(3);

  switch(move){
    case "R":
      return "Rock";
      break;
    case "P":
      return "Paper";
      break;
    case "S":
      return "Scissors";
      break;
    default:
      return "Quit";
      break;
  }
}

/*
  Determing whether the Player or Computer won
  by comparing [playerMove] and [computerMove]
*/

String whoWon(String playerMove, String computerMove){
  if (playerMove == computerMove)
    return "Tie";
  else if (playerMove == "Rock" && computerMove == "Scissors")
    return "You Win!";
  else if (playerMove == "Scissors" && computerMove == "Paper")
    return "You Win!";
  else if (playerMove == "Paper" && computerMove == "Rock")
    return "You Win!";
  else
    return "Computer Wins!";
}

void  main(){
  while (true){
    print("Rock, Paper, Scissors Shoot!");
    String playerMove = getPlayerMove();

    if (playerMove == "Quit"){
      return;
    }  

    print("You played $playerMove");
    String computerMove = getcomputerMove();
    print("Computer played $computerMove");
    print(whoWon(playerMove, computerMove));
    }
}