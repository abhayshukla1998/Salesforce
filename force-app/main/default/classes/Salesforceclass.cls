public class Salesforceclass {
    
    public static void SalesforceMethod(){
        system.debug('This is salesforce');
        Integer i = 1;
        system.debug('i value:'+i);
        
        String s = 'Salseforce';
        system.debug('s value:'+s);
        
        List<Account> accountlist = [select id,name from Account LIMIT 1];
        system.debug('accountlist value:'+accountlist);
}
}