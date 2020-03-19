class PiezaL2{
  Vec2 compensar;
  
  Body b; // cuerpo de box2D, nombre del cuerpo
  float w;
  float h;
  
  PiezaL2(float x, float y, float w_, float h_){ //constructor
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
    
    fill(#7A8177);
    noStroke();
   
    rect(0, 0, w, h);
    rect(0, h, w, h);
    rect(0, -h, w, h);
    rect(-w, h, w, h);
    
    popMatrix();
    
  }

  void makeBody(Vec2 center) {
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(mundo.coordPixelsToWorld(center));
    b = mundo.createBody(bd);
    //forma
    
   /* PolygonShape cubo = new PolygonShape();           //cubo extra
    cubo.m_radius =  mundo.scalarPixelsToWorld(w);
    Vec2 compensar = new Vec2(0,h/2);                    
    compensar = mundo.vectorPixelsToWorld(compensar);
    cubo.compensar.set(compensar.x,compensar.y);             
   // cubo.setAsBox(ancho/2, alto/2);
   */
    CircleShape circle = new CircleShape();         
    circle.m_radius = mundo.scalarPixelsToWorld(w/2);
    Vec2 offset = new Vec2(-w,h);        
    offset = mundo.vectorPixelsToWorld(offset);
    circle.m_p.set(offset.x,offset.y);
   
    PolygonShape base = new PolygonShape();             //figura base
    float ancho = mundo.scalarPixelsToWorld(w);     
    float alto = mundo.scalarPixelsToWorld(h);
    base.setAsBox(ancho/2, alto*1.5); 
    
    b = mundo.createBody(bd);
    
    //propiedades
    FixtureDef fdb = new FixtureDef();  
    fdb.shape = base; 
    
    fdb.friction = 1; // deslice con otros objetos
    fdb.restitution = 0;   //rebote 0=no rebota, +1=rebota constantemente
    fdb.density = 1.5;  //peso del objeto
    
    FixtureDef fdc = new FixtureDef();  
    fdc.shape = circle;
    
    fdc.friction = 1; // deslice con otros objetos
    fdc.restitution = 0;   //rebote 0=no rebota, +1=rebota constantemente
    fdc.density = 1.5;  //peso del objeto
    
    b.createFixture(fdb);
    b.createFixture(fdc);
   // b.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
   // b.setAngularVelocity(random(-5, 5));
  }
}
