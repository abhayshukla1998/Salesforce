public class oppProcessor implements Database.Batchable<sObject>, Database.stateful {
    public Integer recordCount = 0;
    
    
    public Database.QueryLocator start (Database.BatchableContext bc){
       return Database.getQueryLocator([Select Id, Name From Opportunity]);
        
    }
    
    public void execute(Database.BatchableContext bc, List<Opportunity> opp){ 
         
        for(Opportunity op : opp){
            op.LeadSource = 'Web';
        }
        
        update opp;
        recordCount = recordCount + opp.Size();

    }
    public void finish (Database.BatchableContext bc){
        System.debug('Total Record Processed' + recordCount);
    }
}