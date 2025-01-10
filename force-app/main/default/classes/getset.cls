public class getset {
    
    public Integer num1{SET;GET;}
    public Integer num2{SET;GET;}
    public Integer num3{SET;GET;}
    public Integer result{GET;SET;}
    public String Choice{GET;SET;}
    
    public void mainMethod(){
        if(Choice == 'G'){
           greaternum(); 
        }
        else if(Choice == 'S'){
            smallernum();
        }
        else{
            result = 0;
        }
    }
    
    void greaternum(){
        if(num1>num2 && num1>num3){
            result = num1;
            System.debug('Greater number is ' + result);
        }
        else if(num2>num1 && num2>num3){
            result = num2;
            System.debug('Greater number is ' + result); 
        }
        else{
            result = num3;
            System.debug('Greater number is ' + result);
        }
    }
        
         void smallernum(){
        if(num1<num2 && num1<num3){
            result = num1;
            System.debug('Smaller number is ' + result);
        }
        else if(num2<num1 && num2<num3){
            result = num2;
            System.debug('Smaller number is ' + result); 
        }
        else{
            result = num3;
            System.debug('Smaller number is ' + result);
        }
    }
}