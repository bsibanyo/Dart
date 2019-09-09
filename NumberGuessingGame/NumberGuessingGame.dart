import 'dart:math';
import 'dart:io';

void  main()
{
  int guess;
  
  Random rand = new Random();  //creating a random number generator
  int answer = rand.nextInt(100); //gets a random integer from 0 to 99
  do
  {
    print("Enter your guess:");
    String temp = stdin.readLineSync();    //read in from keyboard
    guess = int.parse(temp); //converts String to integer
    if (guess < answer)
    {
      print("Too low!");
    }
    else if (guess > answer)
    {
      print("Too high!");
    }
  }while(guess != answer);
  print("You got it!");
}