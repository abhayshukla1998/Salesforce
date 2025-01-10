public class Tiger extends Animal{
    String type;
 
    public Tiger(String name, Integer age, String color, String type){
        super(name, age, color); // invoking constructor of parent class
        this.type = type;
    }
    
    public override void displayInfo(){
        System.debug(super.name); // super class 
        System.debug(this.type);
        super.displayInfo(); // calling the method of super class using super keyword 
    }

}