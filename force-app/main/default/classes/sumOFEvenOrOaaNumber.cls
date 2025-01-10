public class sumOFEvenOrOaaNumber {

    public Integer num{SET;GET;}
    
    public Integer result{GET;SET;}
    public String choice{GET;SET;}
    
    public void mainSumMethod(){
        if(choice == 'even'){
            sumOfEvenNumber();
        }
        else if(choice == 'odd'){
           sumOfOddNumber(); 
        }
        else{
            result = 0;
            System.debug(result);
        }
    }
    
    public  void sumOfEvenNumber(){
         Integer count = 0;
          result = 0;
        
        while(count<num){
            result = result + count;
            count = count  +2;
        }
        System.debug('sum of even number is ' + result);
    }
    public void sumOfOddNumber(){
         Integer count = 1;
         result = 0;
        while(count<num){
            result = result + count;
            count =count +2;  
        }
        System.debug('sum of odd number is ' + result);
    }
    
}