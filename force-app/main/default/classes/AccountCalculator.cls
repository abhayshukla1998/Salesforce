public class AccountCalculator {
    @future
    public static void countContact(List<Id> accId){
        List<Account> accList = [Select Id,(Select Id From Contacts)
                                From Account Where Id In : accId];
        
        for(Account acc : accList){
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}