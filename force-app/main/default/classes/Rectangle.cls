public class Rectangle extends Shape {
    
    public override void area()
    {
        integer answer = getLength()*getBreadth();
        system.debug('Area of Rectangle:'+answer);
    }
}