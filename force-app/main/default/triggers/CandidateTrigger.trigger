trigger CandidateTrigger on Candidate__c (before insert, before update) {
    
    for(Candidate__c cand : Trigger.new){
        Integer recordsCount = [Select Count() from Candidate__c where name =: cand.name];
        if(recordsCount>0){
            cand.addError('Record is already exist');
        }
    }

}