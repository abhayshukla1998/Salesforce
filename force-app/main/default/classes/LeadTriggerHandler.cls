//When a lead record is created, create a task for the lead owner to follow with the member

public class LeadTriggerHandler {
    
    public static void handleActivitiesAfterInsert(List<Lead> leadList){
        List<Task> taskListToInsert = New List<Task>();
        
        for(Lead leadRecord : leadList){
            Task taskRecord = New Task();
            taskRecord.Priority = 'High';
            taskRecord.OwnerId = leadRecord.OwnerId;
            taskRecord.Description = 'Follow up the New Lead';
            taskRecord.Status = 'Not Started';
            taskRecord.Subject = 'Follow up';
            taskRecord.WhoId = leadRecord.Id;
            taskListToInsert.add(taskRecord);
        } 
        if(!taskListToInsert.isEmpty()){
            insert taskListToInsert;
        }
    }

}