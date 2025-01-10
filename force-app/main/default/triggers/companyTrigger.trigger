trigger companyTrigger on Company__c (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
       // companyTriggerHandler.duplicateFind(Trigger.new);
        companyTriggerHandler.duplicateFound(Trigger.new);
    }
}