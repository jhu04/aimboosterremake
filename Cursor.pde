public class Cursor
{
  private final color red = color(255, 0, 0);
  
  public Cursor()
  {
    
  }
  
  public void display()
  {
    stroke(red);
    strokeWeight(2);
    fill(backgroundColor);
    circle(mouseX, mouseY, 20);
  }
}
