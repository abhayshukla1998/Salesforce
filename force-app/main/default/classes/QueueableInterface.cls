// It runs the processes when the resources gets available
// It return the jobid through which we can get the job status
// We can check that jobid using apex or by using soql
// We can perform job chaining, It means we can call one queueable class from another queueable class
// It support primitive And non primitive data types 
// for callout web services we use  Database.AllowsCallouts
// AsyncApexJob queryStatus = [Select Status, NumberOfErrors From AsyncApexJob Where Id =: jobId];
public class QueueableInterface implements queueable{
    public void execute(QueueableContext qx){
       System.debug('this is queueable Interface');
        try{
         Contact con = new Contact();
        con.LastName = 'Queueable Interface Contact';
        insert con;
        System.debug(con.LastName + ' is inserted');
    }
        catch(Exception e){
            System.debug(e.getMessage());
        }
        Id jobId = System.enqueueJob(new QueueableExample());
        System.debug('job Id Of QueueableExample is '+ jobId);
        }
}

/*
 For run QueueableInterface
 QueueableInterface queue = new QueueableInterface();
Id jobId = System.enqueueJob(queue);
System.debug('job id is '+ jobId);
------or-------
Id jobId = System.enqueueJob(new QueueableInterface());
System.debug('job id is '+ jobId);
*/