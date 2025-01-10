public class companyTriggerHandler {
  /*  
    public static void duplicateFind(List<Company__c> newCompRecord){
        List<Company__c> existingCompRecords = [Select Id, Name, Email__c, Phone__c from Company__c];
        for(Company__c comp : newCompRecord){
            for(Company__c existComp : existingCompRecords){
                if(comp.Phone__c == existComp.Phone__c || comp.Email__c == existComp.Email__c){
                    comp.addError('Duplicate Record');
                }
            } 
        }
    }
    */
  // we can use this method for without having loop inside a loop
    public static void duplicateFound(List<Company__c> newCompRecord){
        Set<String> emailSet = new Set<String>();
        Set<String> phoneSet = new Set<String>();
        for(Company__c comp : newCompRecord){
            if(emailSet.contains(comp.Email__c) || phoneSet.contains(comp.Phone__c)){
                comp.addError('Duplicate Record Found');
            }
            else{
              emailSet.add(comp.Email__c);
            phoneSet.add(comp.Phone__c);  
            } 
        } 
        if(emailSet.Size() >0 || phoneSet.Size() >0){
             List<Company__c> existingCompRecords = [Select Id, Name, Email__c, Phone__c from Company__c Where Email__c IN : emailSet or Phone__c IN : phoneSet];
            if(existingCompRecords.Size() > 0){
                for(Company__c existComp : newCompRecord){
                    existComp.addError('Duplicate Record in the detail');
                }
            }
        }
        
    }
}