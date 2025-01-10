public class CaseTriggerHandler {

    public static void handleBeforeDelete(List<Case> oldRecord){
        Id currentUserPfrofileId = UserInfo.getProfileId();
        Id sysAdminProfileId = [Select Id, Name From Profile Where name = 'System Administrator' Limit 1].Id;
        for(Case caseRec : oldRecord){
            if(sysAdminProfileId != currentUserPfrofileId){
                caseRec.addError('you cannot delete the case');
        }
            
            }
            
    }
    // When a case is created on any account, put the latest case number on the account in the 'Latest case number' field.
    public static void populateLatestCaseNum(List<Case> newList){
       List<Account> accList = new List<Account>();
       
        for(case cs : newList){
            if(cs.AccountId !=null){
                Account acc = new Account();
                acc.Id = cs.AccountId;
                acc.Latest_Case_Number__c = cs.CaseNumber;
                accList.add(acc);
                System.debug(LoggingLevel.Info, 'latest case number');
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}