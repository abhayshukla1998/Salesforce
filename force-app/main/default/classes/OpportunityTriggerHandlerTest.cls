@isTest
public class OpportunityTriggerHandlerTest {
    
    @isTest 
    public static void updateOppDescTest(){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Test'+i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today();
            opp.Amount = 200000;
            oppList.add(opp);
        }
        test.startTest();
        insert oppList;
        test.stopTest();
       
        List<Opportunity> updatedOppList = [Select Id, Description From Opportunity Where Id =: oppList[0].Id];
        System.assertEquals('Hot Opportunity', updatedOppList[0].Description);
    }
}