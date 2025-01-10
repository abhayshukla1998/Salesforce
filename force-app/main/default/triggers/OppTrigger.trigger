trigger OppTrigger on Opportunity ( after insert,before update,after update,after delete) {
    
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        OppTriggerHandler.updateAmountField(Trigger.new);
        
        
    }
    
    if(Trigger.isBefore && Trigger.isUpdate){
        OppTriggerHandler.handleActivitiesBeforeUpdate(Trigger.New,Trigger.oldMap);
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){ 
        OppTriggerHandler.handleActivitiesAfterUpdate(Trigger.New);
    } 
    
    if(Trigger.isAfter && Trigger.isDelete){ 
        OppTriggerHandler.handleActivitiesAfterDelete(Trigger.Old);
    }
    
    if(Trigger.isAfter){
        if(Trigger.isInsert){
         OppTriggerHandler.onAfterInsert(Trigger.new);   
        }else if(Trigger.isUpdate){
          OppTriggerHandler.onAfterUpdate(Trigger.new, Trigger.oldMap);  
        }else if(Trigger.isDelete){
          OppTriggerHandler.onAfterDelete(Trigger.old);  
        }
    }
    
    
}