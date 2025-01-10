public class MethodClass {
    
    public static void Method(){
        //pass by value
        String s = 'Salesforce';
        PassByValueMethod(s);
    }
        public static void SalesforceMethod(){
        // pass by refrence
        List<Integer> Elist = new  List<Integer>();
            system.debug('Elist:'+Elist);
        PassByRefrenceMethod(Elist);
        system.debug('Elist:'+Elist);
            
        }
    
    
    public static void PassByValueMethod(String MyString){
        system.debug('MyString:'+MyString);
    }
    public static void PassByRefrenceMethod(List<Integer> Elist ){
        system.debug('Elist:'+Elist);
        Elist.add(1);
        Elist.add(2);
        Elist.add(3);
        Elist.add(4);
        Elist.add(5);
        system.debug('Elist:'+Elist);
        
    }

}