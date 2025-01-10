public class DemoSObject {
    
    public Void demoMethod(){ 
       // Account acc = new Account(Name='Test',Phone='12345');
       // acc.Name = 'test';
       // acc.Phone = '12345';
        //System.debug('acc:' +acc);
        
       // Student__c std = new Student__c();  
        //std.Card_Number__c = 12345;
        
         //System.debug('std:' +std);
         
        List<Account> accList = new List<Account>();
        accList = [select Id,Name from Account Limit 1];
        System.debug('accList='+accList);
        
    }
}