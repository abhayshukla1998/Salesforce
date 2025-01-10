public class comboboxDataTable {
 @AuraEnabled
    public static List<Account> getAccountDetail(){
        List<Account> accList = [Select Id,Name From Account];
        return accList;
        
    }
    @AuraEnabled
    public static List<Contact> getContactDetail(String fetchAccountId){
        List<Contact> conList = [Select Id,Name,Email,AccountId From Contact Where AccountId =:fetchAccountId];
        return conList;
    }
}