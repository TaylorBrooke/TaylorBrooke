public class mine {
  float x=1200;
  float y=random(100,550);
  float s=random(2,5);                  //s=speed
  
  void display(){
    PImage mine= loadImage ("mine.png");
    image (mine,x,y);
  }
  void move(){
   x=x-s;
  }
}
