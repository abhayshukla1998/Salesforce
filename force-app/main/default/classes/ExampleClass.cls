public class ExampleClass {
    
    public static String address = 'Hindustan';
  
    // Non Static Methods
    // Non static method can call static method and variable
    public String greeting(){
        return 'Namaste India';
    }
    
    public Integer addNumber(Integer a , integer b){
        return a+b;
    }
    // Static Method
    // Static method can not call the non static method and variable
    public static void getMessage(){
        System.debug('hi India');
    }
    public static void modifyNum(integer a){
        a = a+1;
        System.debug(a);   
    }
    public static void modifyedNumber(integer num){
        System.debug(num);
    }
    
}