public class Timer
{
  private int time;
  private int timeEnd;
  
  public Timer(int time)
  {
    this.time = time;
    this.timeEnd = millis() + this.time;
  }
  
  public int timeElapsed()
  {
    return millis() - (timeEnd - time);
  }
  
  public boolean complete()
  {
    return millis() - timeEnd > time;
  }
  
  public void reset()
  {
    this.timeEnd = millis() + this.time;
  }
}
