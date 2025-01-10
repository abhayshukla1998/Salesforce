@isTest 
public class CaseTriggerHabdlerTest {
@isTest
    private static void testPopulateCaseNum(){
        List<Account> accList = new List<Account>();
        List<Case> caseList = new List<Case>();
        
        for(integer i=1; i<=5; i++){
            Account acc = new Account();
            acc.Name = 'test'+i;
            accList.add(acc);
        }
        insert accList;
        
        for(Account acc : accList){
            case cs = new case();
            cs.AccountId = acc.Id;
            cs.Status = 'New';
            cs.Origin = 'Email';
            caseList.add(cs);  
        }
        test.startTest();
        insert caseList; 
        test.stoptest();
        List<Account> updatedAccList = [Select Id,Latest_Case_Number__c From Account Where Id =: accList[0].Id];
        List<Case> newCaseList = [Select Id, CaseNumber From Case Where Id =: caseList[0].Id];
         System.assertEquals(newCaseList[0].CaseNumber, updatedAccList[0].Latest_Case_Number__c); 
        
    }
}