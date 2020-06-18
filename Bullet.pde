public class Bullet
{
  private double x;
  private double y;
  private double xv;
  private double yv;
  
  public Bullet(double x, double y, double xv, double yv)
  {
    this.x = x;
    this.y = y;
    this.xv = xv;
    this.yv = yv;
  }
  
  public double getX()
  {
    return x;
  }
  
  public double getY()
  {
    return y;
  }
  
  private void update()
  {
    x += xv;
    y += yv;
  }
  
  public void display()
  {
    fill(white);
    circle((float)x, (float)y, 5);
    // trail?
    
    this.update();
  }
}
