public class UpdateAccount {
    public static void updateAccounts(){
        List<Account> accToBeUpdated = new List<Account>();
        Set<Id> accIdSet = new Set<Id>();
        
        for(Contact con : [Select Id,Account.Id From Contact Where Name Like '%Test%' And Account.Id != Null]){
            if(!accIdSet.contains(con.Account.Id)){
                Account acc = new Account();
                acc.Id = con.Account.Id;
                acc.Active__c = 'Yes';
                acc.Rating = 'Hot';
                accToBeUpdated.add(acc);
                accIdSet.add(con.Account.Id);
            }
        }
            if(!accToBeUpdated.isEmpty()){
                update accToBeUpdated;
            }
    }
    
}