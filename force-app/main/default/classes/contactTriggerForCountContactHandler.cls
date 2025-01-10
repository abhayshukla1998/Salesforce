//Write a trigger on the contact to count the total number of contacts associated with the account on the insert, update and delete.
public class contactTriggerForCountContactHandler {
    /*
         List<Account> accountList = new List<Account>();
    List<Account> accountListUpdated = new List<Account>();
    public void countContacts(List<Contact> newList)   {
        for (Contact con : newList)  {
            accountList = [SELECT Id,Name,Number_Of_Contacts__c, (SELECT Id, Name FROM Contacts) 
                           FROM Account WHERE Id =: con.AccountId];
        }
        for (Account acc : accountList)  {
            acc.Number_Of_Contacts__c = acc.Contacts.size() ;
            accountListUpdated.add(acc);
        }
        update accountListUpdated;

}*/
    public void countContactOfAccount(List<Contact> newList){
        Set<Id> ids = new Set<Id>();
        integer totalContact = 0;
        for(Contact con : newList){
            ids.add(con.AccountId);    
        }
        List<AggregateResult> aggregateResult = [Select count(Id)totalContactOnAccount, AccountId From Contact Where AccountId In : ids Group by AccountId];
        for(AggregateResult aggResult : aggregateResult){
          totalContact = (integer)aggResult.get('totalContactOnAccount');  
        }
        
        List<Account> accList = [Select Id, Name, Number_Of_Contacts__c from Account Where Id In : ids];
        for(Account acc : accList){
            acc.Number_Of_Contacts__c = totalContact;
        }
        update accList;
    }
}