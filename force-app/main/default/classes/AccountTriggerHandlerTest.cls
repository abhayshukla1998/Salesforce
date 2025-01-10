@isTest
public class AccountTriggerHandlerTest {
  @isTest
    public static void updateRatingTest(){
        // create sample data
        List<Account> accList = new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc = new Account();
            acc.Name = 'Test'+i;
            acc.Industry = 'Energy';
            accList.add(acc);  
        }
        // DML operation
        Test.startTest();
        insert accList;
        Test.stopTest();
        // Query the record
        List<Account> updatedAccList = [Select Id, Rating From Account Where Id =: accList[0].id];
        // condition
        system.assertEquals('Hot', updatedAccList[0].Rating);
    }
    @isTest
    public static void copyBillingToShippingTest(){
        List<Account> accList = new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc = new Account();
            acc.Name = 'Test'+i;
            acc.BillingCity = 'testCity';
            acc.BillingCountry = 'testCountry';
            acc.BillingPostalCode = '1111';
            acc.BillingState = 'testState';
            acc.BillingStreet = 'testStreet';
            acc.CopyBillingAddToShipping__c = true;
            accList.add(acc);  
        }
        
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Account> updatedAccList = [Select Id, ShippingCity From Account Where Id =: accList[0].Id];
        // condition
        system.assertEquals('testCity', updatedAccList[0].ShippingCity);
    }
    
    @isTest
    public static void createRelatedConTest(){

        List<Account> accList = new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc = new Account();
            acc.Name = 'TestAccount' + i; 
            accList.add(acc); 
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Contact> conList = [Select Id From Contact Where AccountId =:accList[0].Id];
        System.assert(conList!=null, 'Contact is not created');
    }
}