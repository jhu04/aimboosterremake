public class Target
{
  private final color darkGray = color(100);
  private final color lightGray = color(200);
  private double x;
  private double y;
  private double r;
  private boolean inc;
  private double incAmount;
  private double xv;
  private double yv;
  
  public Target(double x, double y, double r, double incAmount, double xv, double yv)
  {
    this.x = x;
    this.y = y;
    this.r = r;
    this.inc = true;
    this.incAmount = incAmount;
    this.xv = xv;
    this.yv = yv;
  }
  
  public Target(double x, double y, double incAmount, double xv, double yv)
  {
    this.x = x;
    this.y = y;
    this.r = 1;
    this.inc = true;
    this.incAmount = incAmount;
    this.xv = xv;
    this.yv = yv;
  }
  
  public Target(double x, double y, double incAmount)
  {
    this(x, y, incAmount, 0, 0);
  }
  
  public double getX()
  {
    return x;
  }
  
  public double getY()
  {
    return y;
  }
  
  public double getR()
  {
    return r;
  }
  
  public void incR()
  {
    r += incAmount;
  }
  
  public void decR()
  {
    r -= incAmount;
  }
  
  public boolean getInc()
  {
    return inc;
  }
  
  public void setInc(boolean inc)
  {
    this.inc = inc;
  }
  
  public double dist(double x, double y)
  {
    return Math.sqrt(Math.pow(this.x - x, 2) + Math.pow(this.y - y, 2));
  }
  
  public double mouseDist()
  {
    return dist(mouseX, mouseY);
  }
  
  public boolean clicked()
  {
    return mouseDist() <= r;
  }
  
  private void updatePos()
  {
    x += xv;
    y += yv;
    if (!in(0, x, sizeX))
      xv *= -1;
    if (!in(0, y, sizeY))
      yv *= -1;
  }
  
  public void display()
  {
    //strokeWeight();
    fill(tan);
    circle((float)x, (float)y, (float)r);
    //circle(x, y, 0.67 * r);
    //fill(darkGray);
    //circle(x, y, 0.33 * r);
    
    this.updatePos();
  }
}
