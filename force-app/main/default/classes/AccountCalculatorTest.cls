@isTest
public class AccountCalculatorTest {

    @isTest
    private static void countContactsTest(){
        List<Account> accList = new List<Account>();
        
        for(Integer i=0; i<=250; i++){
            accList.add(new Account(Name='Test '+ i));
        }
        insert accList;
        
        List<Contact> conList = new List<Contact>();
        List<Id> accId = new List<Id>();
        for(Account acc : accList){
            conList.add(New Contact(FirstName ='Test', LastName =acc.Name, AccountId = acc.Id));
            accId.add(acc.Id);
        }
        insert conList;
        
        Test.startTest();
        AccountCalculator.countContact(accId);
        Test.stopTest();
        
        List<Account> accs = [Select Id, Number_Of_Contacts__c From Account];
        System.assertEquals(1, accs[0].Number_Of_Contacts__c);
        
        
        
        
        
    }
}