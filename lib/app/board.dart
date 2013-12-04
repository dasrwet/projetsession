 part of gestion_offre_app;

class Board {
  CanvasRenderingContext2D context;
   Point pd,pf;
   List<double> listy = new List();
   List<String> listx = new List();
  Board(CanvasElement canvas, Point p1, Point p2, OffreEntries offreentries) {
    context = canvas.getContext("2d");
    listy.add(5.0);listy.add(10.0);listy.add(32.0);listy.add(1.0);
    listx.add('experience');listx.add('employe');listx.add('relation');listx.add('fiabilite');
    _construireRepere(p1.x,p1.y, p2.x, p2.y);
    context.stroke();
  }
  _setpoint(xa,ya, xb, yb){
    this.pd= new Point(xa, ya);
    this.pf= new Point(xb, yb);
  }
  void droitY(){
    context.beginPath();
    context.moveTo(pd.x-4, pd.y+4);
    context.lineTo(pd.x, pd.y);
    context.lineTo(pd.x+4, pd.y+4);
    context.moveTo(pd.x, pd.y);
    context.lineTo(pd.x, pf.y+4);
    context.stroke();
    graduY();
  }
  void droitX(){
    context.beginPath();
    context.moveTo(pd.x, pf.y+4);
    context.lineTo(pf.x, pf.y+4);
    context.moveTo(pf.x, pf.y);
    context.lineTo(pf.x+4, pf.y+4);
    context.lineTo(pf.x, pf.y+8);
    context.stroke();
    graduX();
  }
  void graduY(){
    int poid=pf.y-pd.y;
    int nbgrad = round(poid/11);
    double max = Max(listy);
    context.beginPath();
    for (int i=1; i<=10; i++){
      context.moveTo(pd.x-2, pf.y-i*nbgrad);
      context.lineTo(pd.x+2, pf.y-i*nbgrad);
      context.fillText(round(i*(max+1)/10).toString(), pd.x-15, pf.y-i*nbgrad, 9);
    }
    context.stroke();
  }
  void graduX(){
    int poid=pf.x-pd.x;
    int nbgrad = round(poid/(listx.length+1));
    context.beginPath();
    for (int i=1; i<=listx.length; i++){
      context.moveTo(pd.x+i*nbgrad, pf.y+2);
      context.lineTo(pd.x+i*nbgrad, pf.y+6);
      context.fillText(listx.elementAt(i-1),round(pd.x+i*nbgrad-nbgrad*0.1), pf.y+14, nbgrad-10);
    }context.stroke();
  }
  int round(double a){
    return a.round();
  }
  double Max(List list){
    var maxim;
    for(int i=1; i<list.length; i++)
    {
      if(list.elementAt(i-1)<=list.elementAt(i))
        maxim=list.elementAt(i);
      else
        maxim=list.elementAt(i-1);
    }
    return maxim;
  }
  
  _construireRepere(xa,ya, xb, yb)
  {
    List lst = new List();
    lst.add(9.0);lst.add(10.0);lst.add(7.0);lst.add(8.0);
    _setpoint(xa, ya, xb, yb);
    droitY();
    droitX();
    courbe(listy,'SSEI', randomColorCode());
    courbe(lst,'Nortes',  randomColorCode());
  }
  courbe(List list, String nom, String color){
    int poidx=pf.x-pd.x;
    int nbgradx = round(poidx/(listx.length+1));
    
    int poid=pf.y-pd.y;
    int nbgrad = round(poid/11);
    double max = Max(listy);
    context.fillStyle=color;
    
    context.beginPath();
    
    context.moveTo(pd.x+nbgradx,pf.y-round(list.elementAt(0)*(poid-nbgrad)/(max+1)));
    circle(pd.x+nbgradx, pf.y-round(list.elementAt(0)*(poid-nbgrad)/(max+1)), 2);
    context.fillText(list.elementAt(0).toString(),pd.x+nbgradx, pf.y-round(list.elementAt(0)*(poid-nbgrad)/(max+1))-3, 30);
    if(listx.length>1){
    for (int i=1; i<listx.length; i++){
      context.lineTo(pd.x+(i+1)*nbgradx,pf.y-round(list.elementAt(i)*(poid-nbgrad)/(max+1)));
      circle(pd.x+(i+1)*nbgradx, pf.y-round(list.elementAt(i)*(poid-nbgrad)/(max+1)), 2);
      context.fillText(list.elementAt(i).toString(),pd.x+(i+1)*nbgradx, pf.y-round(list.elementAt(i)*(poid-nbgrad)/(max+1))-3, 30);
    }
    }
    String str =list.elementAt(listx.length-1).toString()+' <-- '+nom;
    context.fillText(str,pd.x+(listx.length)*nbgradx, pf.y-round(list.elementAt(listx.length-1)*(poid-nbgrad)/(max+1))-3, 100);
    context.fillStyle=color;
    context.strokeStyle=color;
    context.stroke();
  }
  
  //draw a circle
  void circle(x, y, r) {
    //context.beginPath();
    context.arc(x, y, r, 0, PI*2, true);
    //context.closePath();
    //context.fill();
  }

  //draw a rectangle
  void rectangle(x, y, w, h) {
    context.beginPath();
    context.rect(x,y,w,h);
    context.closePath();
    context.stroke();
  }
  
}

 
