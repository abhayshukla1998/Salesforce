public class SobjectClass {
    
    public static void objectMethod(){
        
        //Standard Object
        Account account = new Account();
        account.Name = 'Salesforce';
        system.debug('account:'+account);
        insert account;
        
        // Custom Object
        Student__c C_Object = new Student__c();
         C_Object.ID = 'salesforce 1.1';
         system.debug('C_Object:'+C_Object);
        insert C_Object;
        
        //Generic Object
        //sObject Sobj = new Account();
        
        
    }

}