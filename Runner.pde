public final color white = color(255);
public final color black = color(0);
public final color forestGreen = color(34, 139, 34);
public final color tan = color(210, 180, 140);
private final int fr = 60;
private final int sizeX = 1400;
private final int sizeY = 800;
private final int fontSize = 20;

color backgroundColor;
ArrayList<Target> targets;
double targetInitSize;
double targetSizeSpeed;
double targetSpeed;
ArrayList<Bullet> bullets;
double bulletSpeed;
Cursor c;
Timer timer;
Timer reload;
Timer fps;

// stats variables
String accuracy;
int numHit, numBullets;

void settings()
{
  size(sizeX, sizeY);
  backgroundColor = forestGreen;
}

void setup()
{
  frameRate(fr);
  c = new Cursor();
  
  targets = new ArrayList<Target>();
  targetInitSize = 30;
  targetSizeSpeed = 0;
  targetSpeed = 2;
  
  bullets = new ArrayList<Bullet>();
  bulletSpeed = 16;
  
  timer = new Timer(1000);
  reload = new Timer(500);
  fps = new Timer(1000);
  
  numHit = 0;
  numBullets = 0;
}

boolean in(double a, double x, double b)
{
  return a <= x && x < b;
}

double mouseDist(int x, int y)
{
  return Math.sqrt(Math.pow(x - mouseX, 2) + Math.pow(y - mouseY, 2));
}

void draw()
{
  background(forestGreen);
  
  // uncomment if want cursor
  //c.display();
  
  // player
  fill(tan);
  circle(sizeX / 2, sizeY / 2, 40);
  fill(black);
  circle(sizeX / 2, sizeY / 2, 20);
  beginShape();
  vertex(sizeX / 2, sizeY / 2);
  vertex(mouseX, mouseY);
  endShape();
  
  for (Target curTarget : targets)
  {
    curTarget.display();
    
    if (curTarget.getInc())
      curTarget.incR();
    else
      curTarget.decR();
    
    if (curTarget.getR() <= 0)
      
    if (curTarget.getR() >= 300)
      curTarget.setInc(false);
  }
  
  for (int i = 0; i < bullets.size(); i++)
  {
    Bullet b = bullets.get(i);
    
    // hit target
    if (get((int)b.x, (int)b.y) != backgroundColor)
    {
      // remove target
      for (int j = 0; j < targets.size(); j++)
      {
        Target curTarget = targets.get(j);
        
        if (curTarget.dist(b.x, b.y) <= curTarget.getR())
        {
          targets.remove(j);
          bullets.remove(i);
          i--;
          
          numHit++;
          
          break;
        }
      }
      
      
    }
    
    // out of bounds
    else if (!in(0, b.x, sizeX) || !in(0, b.y, sizeY))
      bullets.remove(i);
      
    b.display();
  }
  
  if (timer.complete())
  {
    float randAngle = random((float)Math.PI * 2);
    targets.add(new Target((int)random(sizeX), (int)random(sizeY), targetInitSize, targetSizeSpeed, targetSpeed * Math.cos(randAngle), targetSpeed * Math.sin(randAngle)));
    timer.reset();
  }
  
  // stats
  if (numHit != 0)
    accuracy = (int)(100 * numHit / numBullets) + "%";
  else
    accuracy = "N/A";
  
  String fpsStr = "" + (1000 / fps.timeElapsed());
  fps.reset();
  
  fill(black);
  textSize(fontSize);
  text("Time: " + (millis() / 1000), 10, fontSize);
  text("Accuracy: " + accuracy, 10 * fontSize, fontSize);
  text("FPS: " + fpsStr, 20 * fontSize, fontSize);
}

void mousePressed()
{
  // fire a bullet
  if (reload.complete())
  {
    double xv = (mouseX - sizeX / 2) / (mouseDist(sizeX / 2, sizeY / 2)) * bulletSpeed;
    double yv = (mouseY - sizeY / 2) / (mouseDist(sizeX / 2, sizeY / 2)) * bulletSpeed;
    bullets.add(new Bullet(sizeX / 2, sizeY / 2, xv, yv));
    reload.reset();
    
    numBullets++;
  }
  
  //numClicks++;
  
  //if (get(mouseX, mouseY) == backgroundColor)
  //  return;
}
