class Piezao{
  Vec2 compensar;
  
  Body b; // cuerpo de box2D, nombre del cuerpo
  float w;
  float h;
  
  Piezao(float x, float y, float w_, float h_){ //constructor
    w = w_;
    h = h_;
    makeBody(new Vec2(x, y));

  }
  
  void killBody() {
    mundo.destroyBody(b);
  }
  
  boolean done() {
   Vec2 pos = mundo.getBodyPixelCoord(b);
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }
  
  void Display(){
    Vec2 posicion = mundo.getBodyPixelCoord(b);  //moviento y desplazamiento segun los golpes
    float angulo = b.getAngle();    //rotacion segun los golpes
     
    rectMode(CENTER);
    pushMatrix(); //inicia el dibujado de la pieza
    translate(posicion.x, posicion.y);  //moviento y desplazamiento segun los golpes
    rotate(-angulo);   //rotacion segun los golpes    
    
    fill(#292A34);
    noStroke();
   
    rect(0, 0, w+w, h+h);
    
    popMatrix();
    
  }

  void makeBody(Vec2 center) {
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(mundo.coordPixelsToWorld(center));
    b = mundo.createBody(bd);
    //forma
   
    PolygonShape base = new PolygonShape();             //figura base
    float ancho = mundo.scalarPixelsToWorld(w);     
    float alto = mundo.scalarPixelsToWorld(h);
    base.setAsBox(ancho, alto); 
    
    b = mundo.createBody(bd);
    
    //propiedades
    FixtureDef fdb = new FixtureDef();  
    fdb.shape = base; 
    
    fdb.friction = 0.3; // deslice con otros objetos
    fdb.restitution = 0;   //rebote 0=no rebota, +1=rebota constantemente
    fdb.density = 4;  //peso del objeto
    
    b.createFixture(fdb);
   // b.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
   // b.setAngularVelocity(random(-5, 5));
  }
}
