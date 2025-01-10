trigger CaseTrigger on Case (before insert, before Delete, after insert) {

    if(Trigger.isBefore && Trigger.isDelete){
        CaseTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if(Trigger.isAfter && Trigger.isInsert){
       CaseTriggerHandler.populateLatestCaseNum(Trigger.new); 
    }
}