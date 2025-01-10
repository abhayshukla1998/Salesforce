// future method runs in their own thread
// it runs when the resources are available
// future method must be static
// future method can be called from static or non static method
// future method can not call any other future method
// it support primitive data types
// it is used when we are making callout web services  

public class FutureMethod {
    public FutureMethod(){
        System.debug('this is future method constructor');
        nonStaticMethod();
       // method1(5, 'virat kohli');
        List<String> nameList = new List<String>();
        nameList.add('captain');
        nameList.add('dhoni');
        
        Set<Id> ids = new Set<Id>();
        ids.add('0015g00001DYz8eAAD');
        exampleMethod(nameList, ids);
    }
@future
    public static void method1(Integer num, String Name){
        System.debug('this is method 1');
        System.debug('number is == '+ num);
        System.debug('Name is == '+ Name);
    }
  @Future
    Public static void exampleMethod(List<String> nameList, Set<Id> ids){
        System.debug('this is exampleMethod');
        System.debug('Name List == ' + nameList);
        System.debug('Set of id is == ' + ids);
    } 
    public void nonStaticMethod(){
        System.debug('this is nonStaticMethod');
       method1(5, 'virat kohli');
    }   
}
// for run future method
// FutureMethod futuremethod = new FutureMethod();