/*tretis clasico con diferentes propiedades*/
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing mundo;

ArrayList <PiezaL>  cubos;
ArrayList <PiezaL2> cubos2;
ArrayList <Piezal>  cubos3;
ArrayList <Piezaz>  cubos4;
ArrayList <Piezaz2> cubos5;
ArrayList <Piezat>  cubos6;
ArrayList <Piezao>  cubos7;

Limite suelo;
Limite techo;
Limite paredi;
Limite paredd;
float piezarandom;
int elegir =0;

void setup(){
  size(400,400);
  mundo = new Box2DProcessing(this);
  mundo.createWorld();
  mundo.setGravity(0, -20); //gravedad
  
  cubos  = new ArrayList <PiezaL>(); 
  cubos2 = new ArrayList <PiezaL2>(); 
  cubos3 = new ArrayList <Piezal>();
  cubos4 = new ArrayList <Piezaz>();
  cubos5 = new ArrayList <Piezaz2>();
  cubos6 = new ArrayList <Piezat>();
  cubos7 = new ArrayList <Piezao>();
  
  suelo = new Limite(200,395,400,5);   //en box2d la posicion si opera como un plano carteciano normal
  techo = new Limite(200,5,400,5);     //(se construlle a partir del centro)
  paredi = new Limite(5,200,5,400 );
  paredd = new Limite(395,200,5,400);
  
}

void draw(){
  background(250);
  mundo.step(); //detiene el mundo
  piezarandom = (random(0, 70));
  
  for(PiezaL p:cubos){
    p.Display();
  }
  for(PiezaL2 p:cubos2){
    p.Display();
  }
  for(Piezal p:cubos3){
    p.Display();
  }
  for(Piezaz p:cubos4){
    p.Display();
  }
  for(Piezaz2 p:cubos5){
    p.Display();
  }
  for(Piezat p:cubos6){
    p.Display();
  }
  for(Piezao p:cubos7){
    p.Display();
  } 
  
  suelo.display();
  techo.display();
  paredi.display();
  paredd.display();
}

void mousePressed(){
 
  if(piezarandom <= 10){
     elegir = 0;}
  if(piezarandom <= 20 && piezarandom > 10){
     elegir = 1;}
  if(piezarandom <= 30 && piezarandom > 20){
     elegir = 2;}
  if(piezarandom <= 40 && piezarandom > 30){
     elegir = 3;}
  if(piezarandom <= 50 && piezarandom > 40){
     elegir = 4;}
  if(piezarandom <= 60 && piezarandom > 50){
     elegir = 5;}
  if(piezarandom > 60){
     elegir = 5;}
  
  switch(elegir){
    case 0:
    cubos.add(new PiezaL(mouseX, mouseY, 30, 30));
    break;
    case 1:
    cubos2.add(new PiezaL2(mouseX, mouseY, 30, 30));
    break;
    case 2:
    cubos3.add(new Piezal(mouseX, mouseY, 30, 30));
    break;
    case 3:
    cubos4.add(new Piezaz(mouseX, mouseY, 30, 30));
    break;
    case 4:
    cubos5.add(new Piezaz2(mouseX, mouseY, 30, 30));
    break;
    case 5:
    cubos6.add(new Piezat(mouseX, mouseY, 30, 30));
    break;
    case 6:
    cubos7.add(new Piezao(mouseX, mouseY, 30, 30));
    break;
  }
  
}
