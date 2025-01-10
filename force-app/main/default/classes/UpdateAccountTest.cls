@isTest
public class UpdateAccountTest {
    @isTest
    private static void testAcountUpdate(){
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.Active__c = 'No';
        acc.Rating = 'Cold';
        insert acc;
        
        Contact con = new Contact();
        con.FirstName = 'Test';
        con.LastName = 'TriggerAccount';
        con.AccountId = acc.Id;
        insert con;
        
        UpdateAccount.UpdateAccounts();
        
        Account updateAcc = [Select Id, Active__c, Rating From Account Where Id =: acc.Id];
        System.assertEquals('Hot', updateAcc.Rating);  
    }  
}