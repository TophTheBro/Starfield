Particle[] field = new Particle[350];
void setup(){
 size(500, 500);
 for(int i = 0; i < 4; i++){
   field[i] = new OddballParticle(i);
 }
 for(int i = 4; i < field.length; i++){
  field[i] = new Particle(); 
 }
}
void draw(){
 background(0);
 for(int i = 0; i < field.length; i++){ 
   field[i].move();
   field[i].show();
 }
}

class Particle{
 double myX, myY;
 double myAngle;
 double myVelocity;
 int [] myColor = new int[3];
 Particle(){
   myX = (int)(Math.random()*500);
   myY = (int)(Math.random()*500);
   myVelocity = (Math.random() * 7) - 3;
   if(myX > 250 && myY > 250){
     myAngle = (2*Math.PI) - Math.atan((250-myY)/(myX-250));
   }else if(myX < 250 && myY > 250){
    myAngle = Math.PI + Math.atan((250-myY)/(250-myX)); 
   }else if(myX < 250 && myY < 250){
    myAngle = Math.PI - Math.atan((myY-250)/(250-myX)); 
   }else{
     myAngle = Math.atan((myY-250)/(myX-250));
   }
   myColor[0] = 256;
   myColor[1] = 256; 
   myColor[2] = 256;
 }
  void move(){
    myX = myX + myVelocity * Math.cos(myAngle);
    myY = myY + myVelocity * Math.sin(myAngle);
    if(myX > 500){
      myX = 0;
      myY = 500 - myY;
    }if(myX < 0){
     myX = 500;
     myY = 500 - myY;
    }if(myY > 500){
     myY = 0;
     myX = 500 - myX;
    }if(myY < 0){
     myY = 500;
     myX = 500-myX;
    }
  }
  void show(){
   fill(myColor[0], myColor[1], myColor[2]);
   float size = 5.5;
   ellipse((float)myX, (float)myY, (float)size, (float)size);
  }
}
class OddballParticle extends Particle{
  float radius;
  OddballParticle(int i){
    radius = 200;
    if(i == 0){
    myX = 250;
    myY = 100;
    myAngle = 3*Math.PI/2;
    }else if(i == 1){
     myX = 250;
     myY = 400;
     myAngle = Math.PI/2;
    }else if(i == 2){
      myX = 400;
      myY = 250;
      myAngle = 0;
    }else if(i == 3){
      myX = 100;
      myY = 250;
      myAngle = Math.PI;
    }
    myColor[0] = 247;
    myColor[1] = 92;
    myColor[2] = 92;
  }
  void move(){
   radius -= 0.3;
   myAngle += 0.03;
   myX = 250 + radius*Math.cos(myAngle);
   myY = 250 + radius*Math.sin(myAngle);
   if(radius <= -200){
    radius = 200; 
   }
  }
  void show(){
   float size = 15;
   fill(myColor[0], myColor[1], myColor[2]);
   ellipse((float)myX, (float)myY, size, size); 
  }
}
