public class OppTriggerHandler {
     
     public static void updateAmountField(List<Opportunity> updatedOpp){
       /* String accId = '';
        Decimal oppTotalAmount = 0;
        for(Opportunity opp : updatedOpp){
            accID = opp.AccountId;
        }
        List<AggregateResult> aggregateList = [Select Sum(Amount)totalAmount,AccountId From Opportunity where AccountId=:accId Group By AccountId ];
        System.debug(LoggingLevel.Info,'aggregateList'+aggregateList);
        for(AggregateResult aggResult : aggregateList){
            oppTotalAmount = (Decimal)aggResult.get('totalAmount');
                    System.debug(LoggingLevel.Info,'oppTotalAmount'+oppTotalAmount);
        }
        
       List<Account> accList = [Select id, totalOppAmount__c From Account Where ID =: accId];
        for(Account acc : accList){
            acc.totalOppAmount__c = oppTotalAmount;
        }
        update accList;
        */
         Map<Id,List<Opportunity>> accountOppMap = new Map<Id,List<Opportunity>>();
         Set<Id> accId = new Set<Id>();
         for(Opportunity opp : updatedOpp){
             accId.add(opp.AccountId);
         }
         List<Opportunity> oppList = [Select Id, Name,Amount, AccountId From Opportunity Where AccountId In : accId];
         for(Opportunity opp : oppList){
             if(!accountOppMap.containsKey(opp.AccountId)){
                 accountOppMap.put(Opp.AccountId, new List<Opportunity>());
             }
             accountOppMap.get(Opp.AccountId).add(opp);   
         }
         List<Account> updatedAcc =  [Select Id, totalOppAmount__c From Account where Id In : accId];
         for(Account acc :updatedAcc){
             Decimal totalAmount = 0;
             List<Opportunity> updatedOppList = new List<Opportunity>();
            updatedOppList =  accountOppMap.get(acc.Id);
             for(Opportunity opp : updatedOppList){
                 totalAmount += opp.Amount;
             }
             acc.totalOppAmount__c = totalAmount;
         }
         update updatedAcc;
    }
    
    
    public static void handleActivitiesBeforeUpdate(List<Opportunity> newOppList, Map<Id,Opportunity> oldOppList){
        
       // for(Opportunity newOpp : newOppList){
           // for(Opportunity oldOpp : oldOppList){
              //  if(newOpp.Id == oldOpp.Id && newOpp.StageName != oldOpp.StageName){
                //    System.debug('Stage has been Modified');
               // }
           // }
        //}
        for(Opportunity newOpp : newOppList){
            if(oldOppList.get(newOpp.Id).StageName != newOpp.StageName){
                System.debug('Stage has been Modified');
                newOpp.Amount = newOpp.Probability * newOpp.ExpectedRevenue;
            }
            
        }        
    }
    
    public static void handleActivitiesAfterUpdate(List<Opportunity> oppList){
        List<Task> taskListToInsert = New List<Task>();
        List<Id> ListOfOppIds = new List<Id>();
        List<OpportunityTeamMember> deleteMemberList = new List<OpportunityTeamMember>();
        
        for(Opportunity opp : oppList){
            ListOfOppIds.add(opp.Id);
        }
        List<OpportunityTeamMember> teamMembers = [Select Id, OpportunityId From OpportunityTeamMember Where OpportunityId In : ListOfOppIds];
        for(Opportunity opp : oppList){
            if(opp.StageName == 'Closed Won'){
                // Create Related Task Record
                Task taskRecord = New Task();
                taskRecord.Priority = 'High';
                taskRecord.OwnerId = opp.OwnerId;
                taskRecord.Description = 'Please split the revenue amongst the team member';
                taskRecord.Status = 'Not Started';
                taskRecord.Subject = 'Split Revenue';
                taskRecord.WhatId = opp.Id;
                taskListToInsert.add(taskRecord);
            }
            else if(opp.StageName == 'Closed Lost'){
                for(OpportunityTeamMember teammember : teamMembers){
                    if(teamMember.OpportunityId == opp.Id){
                        deleteMemberList.add(teamMember);
                    }
                }
            }
        }
        if(!taskListToInsert.isEmpty()){
            insert taskListToInsert;
        }
        if(!deleteMemberList.isEmpty()){
          delete deleteMemberList;  
        }
    }
    
    public static void handleActivitiesAfterDelete(List<Opportunity> oppList){
        Set<Id> accountId = new Set<Id>();
        Map<Id,Id> oppVsAccountMap = new Map<Id,Id>();
         Map<Id,Id> accIdVsOwnerIdMap = new Map<Id,Id>();
        
        for(Opportunity opp : oppList){
            accountId.add(opp.AccountId);
            oppVsAccountMap.put(opp.Id, opp.AccountId);
            
        }
        
        List<Account> accountRecords = [Select Id, OwnerId From Account Where Id In : accountId];
        
        for(Account acc : accountRecords){
            accIdVsOwnerIdMap.put(acc.Id, acc.OwnerId);
            
        }
        List<Task> taskList = new List<Task>();
        for(Opportunity opp : oppList){
            Task taskRecord = new Task();
            taskRecord.Description = 'Please investigate why opportunity was deleetd';
            taskRecord.Priority = 'High';
            taskRecord.OwnerId = accIdVsOwnerIdMap.get(oppVsAccountMap.get(opp.Id)); 
            taskRecord.Status = 'Not started';
            taskRecord.Subject = 'Follow Up';
            taskList.add(taskRecord); 
            
        }
        if(!taskList.isEmpty()){
            insert taskList;
            
        }
        
    }
    
    // Rollup summary for lookup by trigger
    
    public static void onAfterInsert(List<Opportunity> newList){
        Set<Id> accIds = new Set<Id>();
        List<Account> accToBeUpdated = new List<Account>();
        
        for(Opportunity opp : newList){
            if(opp.AccountId != null){
                accIds.add(opp.AccountId);
      }
        }
        accToBeUpdated = calculateAnnualRevenue(accIds);
        
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        }
    }
    public static void onAfterUpdate(List<Opportunity> newList, Map<Id,Opportunity> oldMap){
        Set<Id> accIds = new Set<Id>();
        List<Account> accToBeUpdated = new List<Account>();
        
        for(Opportunity opp : newList){
            if(opp.AccountId != null && opp.Amount != oldMap.get(opp.Id).Amount){
                accIds.add(opp.AccountId);
      }
        }
        accToBeUpdated = calculateAnnualRevenue(accIds);
        
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        }
    }
    public static void onAfterDelete(List<Opportunity> oldList){
        Set<Id> accIds = new Set<Id>();
        List<Account> accToBeUpdated = new List<Account>();
        
        for(Opportunity opp : oldList){
            if(opp.AccountId != null){
                accIds.add(opp.AccountId);
      }
        }
        accToBeUpdated = calculateAnnualRevenue(accIds);
        
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        }
    }
    
    public static List<Account> calculateAnnualRevenue(Set<Id> accIds){
        List<Account> accToBeUpdated = new List<Account>();
        Map<Id, Decimal> accIdToAnnualRevenue = new Map<Id, Decimal>();
        
        For(Opportunity opp : [Select Id, Amount, AccountId From Opportunity Where AccountId In : accIds]){
            Decimal total = 0;
            if(accIdToAnnualRevenue.containsKey(opp.AccountId)){
                total = accIdToAnnualRevenue.get(opp.AccountId);
            }
            if(opp.Amount != null){
                total = total + opp.Amount;
            }
            accIdToAnnualRevenue.put(opp.AccountId, total);
        }
        if(!accIdToAnnualRevenue.isEmpty()){
            for(Id i : accIdToAnnualRevenue.keySet()){
                Account acc = new Account();
                acc.Id = i;
                acc.AnnualRevenue = accIdToAnnualRevenue.get(i);
                accToBeUpdated.add(acc);
            }
        }
        return accToBeUpdated;
    }
    
}