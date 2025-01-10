public class contactTriggerHandler {
    
    public static void handleBeforeInsert(List<Contact> conRecord){
        
        for(Contact con : conRecord){
            if(con.AccountId == null){
                con.addError('Account is mandatory for Contact');
            }
        }
    }


    public static void handleInsert(List<Contact> newRecord){
        List<Contact> existingRecord = [Select Id, LastName, Phone, Email From Contact Limit 50000];
        for(Contact con : newRecord){
            for(Contact existingCon : existingRecord){
                if(con.LastName == existingCon.LastName && con.Phone == existingCon.Phone && con.Email == existingCon.Email){
                    con.addError('Duplicate Found');
                }
                
            }
        }
    }
    
    public static void sendEmailNotification(List<Contact> conList){
        List<Messaging.Email> emailList = new List<Messaging.Email>();
        
        for(Contact con : conList){
            if(con.Email != null){
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                String[] toAddress = new String[]{con.Email};
                    emailMsg.setToAddresses(toAddress);
                String emailSub = 'Welcome ' + con.FirstName;
                emailMsg.setSubject(emailSub);
                String Name = 'Test Trigger';
                emailMsg.setSenderDisplayName(Name);
                
                String content = 'Hi ' + con.FirstName + '<br/><br/>' +
                    'Welcome to the salesforce ecosystem';
                emailMsg.setHtmlBody(content);
                emailList.add(emailMsg);
            }
        }
        Messaging.sendEmail(emailList);
        
    }
    public static void updateAccountPhone(List<Contact> conRecord){
	 Map<Id,String> mapRecord = new Map<Id,String>();
	 
	 for(Contact con : conRecord){  
		mapRecord.put(con.AccountId,con.Phone);
	 }
 List<Account> accList = [Select Id, Name, Phone From Account Where Id In : mapRecord.KeySet()];
 for(Account acc : accList){
       acc.Phone = mapRecord.get(acc.Id);
 }
 update accList;
	 }
    
    public static void updatedAccount(List<Contact> conList){
        List<Id> Ids = new List<Id>();
        for(Contact con : conList){
            Ids.add(con.AccountId);
        }
        List<Account> accList = [Select Id, Phone From Account Where Id In : Ids];
        List<Account> updatedAccList = new List<Account>();
        for(Account acc : accList){
            for(Contact con : conList){
                if(con.AccountId == acc.Id){
                    acc.Phone = con.Phone;
                    updatedAccList.add(acc);
                }
            }
        }
        update updatedAccList;
    }
    
}