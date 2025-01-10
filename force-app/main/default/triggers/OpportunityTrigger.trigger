trigger OpportunityTrigger on Opportunity (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        OpportunityTriggerHandler.updateOpprtunityDesc(Trigger.New);
    }
    
}