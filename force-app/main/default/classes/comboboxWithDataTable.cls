public class comboboxWithDataTable {
    @AuraEnabled
    public static List<Account> getAccountForCombobox(){
        List<Account> accountList = [Select Id, Name from Account];
        return accountList;
    }
    @AuraEnabled
    public static List<Contact> getContactRecord(String selectAccountId){
        List<Contact> contactRecord = [Select Id, Name, Email,AccountId From Contact Where AccountId =:selectAccountId];
        return contactRecord;
    }
    
}