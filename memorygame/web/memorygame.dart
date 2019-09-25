import 'dart:html';
import 'dart:async';  //for Timer

//constants makes for maintainable code

const int NUM_CARDS = 16;
const int NUM_OF_EACH = 4;
const String CARD_BACK = "img/card_back.png";
const List<String> CARD_FILE_NAMES = const ["img/dog.png", "img/cat.png", "img/giraffe.png", "img/turtle.png"];

int strikes, cardsLeft;
List<String> cards;   //the actual deck
ImageElement lastClicked;   //the last clicked fi not two clicked

///Resets the game board for a new game
void reset(){
  strikes = 0;
  cardsLeft = NUM_CARDS;
  querySelector("#num_strikes").text - strikes.toString();
  querySelector("#num_left").text = cardsLeft.toString();

  
  //source of the images
  for (ImageElement img in querySelectorAll("img")){
    img.src = CARD_BACK;
  }
  //creating the randomly ordered deck of cards
  cards = new List();
  for (String cardFileName in CARD_FILE_NAMES){
    for(int i = 0; i < NUM_OF_EACH; i++){
      cards.add(cardFileName);
    }
  }
  cards.shuffle();
}

///Main game login, checks if two cards have been matched
///or not; also flips cards when clicked
void cardClicked(MouseEvent event){
  ImageElement clickedCard = event.target; //which card was clicked
  //if the card's already turned over, ignore
if (!clickedCard.src.endsWith(CARD_BACK)){
  return;
}
//otherwise flip it over
int clickedNumber = int.parse(clickedCard.alt); //thing we stored
clickedCard.src = cards[clickedNumber];

if (lastClicked == null) {
  lastClicked = clickedCard;
}
else {
  if (clickedCard.src == lastClicked.src){ //we have match!
    cardsLeft -= 2;
    querySelector("#num_left").text = cardsLeft.toString();

  }
  else{//we have a strike!
      strikes++;
      querySelector("#num_strikes").text = strikes.toString();

      //flip them back after 2 seconds
      ImageElement tempClicked = lastClicked;
      Timer t = new Timer(const Duration(seconds: 2), (){
        clickedCard.src = CARD_BACK;
        tempClicked.src = CARD_BACK;
      });
  }
  lastClicked = null;
}

void newGame(MouseEvent event) => reset();

void main(){
  for(int i = 0; i < NUM_CARDS; i++){
    ImageElement ie = new ImageElement(height:100, width:100);
    ie.onClick.listen(cardClicked);
    ie.alt = i.toString(); //a way of tangling the cards
    querySelector("#card_box").append(ie);
  }
  querySelector("#new_game_button").onClick.listen(newGame);
  reset();
}