trigger LeadTrigger on Lead (before insert, before update,after insert) {
    
    if(Trigger.isAfter && Trigger.isInsert){
        leadTriggerHandler.handleActivitiesAfterInsert(Trigger.New);
    }
    
    
    Map<String,Contact> mapOfContact = new Map<String,Contact>();
    List<Contact> allConList = [Select Id, email From Contact];
    for(Contact con :allConList ){
        mapOfContact.put(con.email, con);
    }
    for(Lead l : trigger.New){
        if((l.email!=null) && ((trigger.isInsert) || (l.email!=trigger.oldMap.get(l.id).email))){
          if(mapOfContact.containsKey(l.email)){
              l.email.addError('Contact with same email id already exist');
          }  
        }
    }

}