public class Circle extends Shape {
    
    public override void area()
    {
      decimal answer = 3.14*getRadius()*getRadius();
        system.debug('Area of Circle:'+answer);
    }

}