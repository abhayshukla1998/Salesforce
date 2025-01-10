public virtual class Shape {
   private integer length = 4;
    private integer breadth = 4;
    private integer radius = 8;
    
    public virtual void area(){
        system.debug('Area of:');
    }
    // get length
    public virtual integer getLength(){
        return length;
    }
    // get breadth
    public virtual integer getBreadth(){
        return  breadth; 
    }
    //get radius
    public virtual integer getRadius(){
        return radius;
    }
}