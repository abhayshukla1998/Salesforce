public class firstclass {
   
     public Integer num;
     public Integer count;
     public Integer result;
     public String choice;
    
    public void addEvenNumber(){
        if(choice == 'even'){
            while(count<num){
                result = result + count;
                count = count +2;
            }
            try{
           System.debug('the sum of even number is' +result); 
        }
        catch(exception e){
            System.debug('exception is' +e.getMessage());
        }    
    }
        if(choice == 'odd'){
            while(count<num){
                result = result + count;
                count = count +2;
            }
            try{
           System.debug('the sum of odd number is' +result); 
        }
        catch(exception e){
            System.debug('exception is' +e.getMessage());
        }    
    }
    }
}