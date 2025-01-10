trigger AccountTrigger on Account (before insert, after insert) {
    if(trigger.isBefore && trigger.isInsert){
        AccountTriggerHandler.updateRating(trigger.new);
        AccountTriggerHandler.copyBillingToShipping(trigger.new);
    }
    if(trigger.isAfter && trigger.isInsert){
        AccountTriggerHandler.createRelatedContact(trigger.new);
    }
     
}