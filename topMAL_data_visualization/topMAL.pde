color[] minard = {#666666, #607F9C, #E9CCAE, #FFFFF3, #D01312};
color[] palette = minard;
PFont labelFont;

Table animeData;
int rowCount;
int d=10;
float theta;

void setup() {
  size(670, 470);
  animeData = new Table("animeData - Data (3).tsv");
  rowCount = animeData.getRowCount();
  println("rowCount = " + rowCount);
  labelFont = loadFont("GillSansMT-Bold-48.vlw");
  smooth();

}

void draw() {
  background(palette[0]);
  textFont(labelFont);
  textSize(12);
  fill(180);
  stroke(180);
  
    //x axis
  textAlign(CENTER);
  line(100, 430, 550, 430);
  text("Episode count", 325, 445);
  
  // Line and labels for Y axis
  line(100, 30, 100, 430);                            
  text("Number of MAL \nmembers", 50, 250);
  smooth();
  
  // Gets data, draws dots
  for (int row = 0; row < rowCount; row++) {
    String title = animeData.getString(row, 0);
    int eps = animeData.getInt(row, 1);
    float x=map(eps,1,306,120,540);
    
    int members = animeData.getInt(row, 3);
    float y=map(members,15510,781271,400,50);
    noStroke();
    fill(#FFBA00, 100);
    ellipse(x,y,d,d);
    
    // rollover to get text
    textAlign(LEFT);
    fill(180);
    if(dist(x,y,mouseX,mouseY)<(d/2+1)){
      row=row+1;
      //fill(#607F9C,220);
      //ellipse(x+110,y+10,260,80);
      fill(#FFFFF3);
      text("     "+title+"\nRank: "+row+"\n# of members: "+members+"\n    Episodes: "+eps,x+10,y-10);
      fill(#D01312, 180);
      ellipse(x,y,d,d);
    }
  }

}