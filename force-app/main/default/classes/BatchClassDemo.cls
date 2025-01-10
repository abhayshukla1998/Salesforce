public class BatchClassDemo implements Database.Batchable<sObject> {

    public static Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'Select Id, Name From Account';
        return Database.getQueryLocator(query);
    }
    
    public static void execute(Database.BatchableContext bc, List<Account> scope){
        
        for(Account acc : scope){
            //acc.Name = acc.Name+' BatchUpdate '; 
       
            acc.Name = acc.Name; 

           //acc.Name = acc.Name.remove('BatchUpdate'); 
        }
     Update scope;    
    }
    
    public static void finish(Database.BatchableContext bc){
        System.debug('finish Method executed');
        List<String> mailToString = new List<String>();
        mailToString.add('');
        
        Messaging.SingleEmailMessage myEmail = new Messaging.SingleEmailMessage();
        myEmail.setToAddresses(mailToString);
        myEmail.setSubject('Batch Class Email');
        myEmail.setPlainTextBody('this is a email for process the batch class');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{myEmail});
        System.debug('Email sent');
        
    }
}
// for run batch class
// BatchClassDemo batchClass = new BatchClassDemo();
// Id jobId = Database.executeBatch(batchClass);
// System.debug('job id is== ' + jobid); 
// ----------or---------
// Id jobid = Database.executeBatch(new BatchClassDemo());
// System.debug('job id is == '+ jobId);