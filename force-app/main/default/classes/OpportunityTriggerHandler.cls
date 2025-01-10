public class OpportunityTriggerHandler {
  
    // Upon opportunity creation if amount is (100000-500000) then populate description 'hot opportunity'
    
    public static void updateOpprtunityDesc(List<Opportunity> oppList){
        for(Opportunity opp : oppList){
            if(opp.Amount != null && opp.Amount >= 100000 && opp.Amount <= 500000){
              opp.Description = 'Hot Opportunity';
            }
        }
    }
}