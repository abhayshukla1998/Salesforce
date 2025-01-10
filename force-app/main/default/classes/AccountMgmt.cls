@RestResource(urlMapping = '/accountmgmt/')
global class AccountMgmt {
    
    @httpGet
    global static AccountWrapper getTopAccounts(){
        Map<String,String> paramsMap = RestContext.request.params;
        Set<Id> accountIdsSet = new Set<Id>();
        String accIndustry = paramsMap.get('industry');
        List<Account> accList = [Select Id, Name, Industry, Rating, AnnualRevenue From Account Where
                                 AnnualRevenue!=null and Industry =: accIndustry Order by AnnualRevenue desc limit 10 ];
       
        for(Account acc : accList){
            accountIdsSet.add(acc.Id);
        }
        
        List<Contact> conList = [Select Id, LastName, FirstName, Email From Contact Where AccountId In : accountIdsSet];
        List<Case> caseList = [Select Id, Priority, Subject From Case Where AccountId In : accountIdsSet];
         
        AccountWrapper accWrapper = new AccountWrapper();
        accWrapper.accList = accList;
        accWrapper.conList = conList;
        accWrapper.caseList = caseList;
        
      return accWrapper;
}
     global class AccountWrapper{
        List<Account> accList;
        List<Contact> conList;
        List<Case> caseList;
    }
    
    @httpPost
    /*global static String createAccount(String accName, String accIndustry, String accRating){
        Account acc = new Account();
        acc.Name = accName;
        acc.Industry = accIndustry;
        acc.Rating = accRating;
         
        try{
            insert acc;
            return 'Account Created Successfully';  
        }catch(exception ex){
            return ex.getMessage();
        } 
    }*/
    global static String createAccountAndContact(AccountInformation information){
        Account accRecord = information.accountRecord;
        Contact conRecord = information.contactRecord;
        try{
            insert accRecord;
            conRecord.AccountId = accRecord.Id;
            insert conRecord;
            return 'Account And Contact Created SuccessFully';
        }catch(exception ex){
            return ex.getMessage();
        }
    }
     global class AccountInformation{
        global Account accountRecord {get;set;}
        global Contact contactRecord {get;set;}
    }
    
        @httpdelete
        global static String deleteAccount(){
          Map<String,String> paramsMap = RestContext.request.params;
            String accountId = paramsMap.get('accId');
             List<Account> accList = [Select Id From Account Where Id =: accountId];
            if(!accList.isEmpty()){
               try{
                    delete accList;
                     return 'Record Deleted Successfully';    
        }catch(exception ex){
            return ex.getMessage();
        } 
       }else{
           return 'Record not found';
          }
       } 
   
   
}