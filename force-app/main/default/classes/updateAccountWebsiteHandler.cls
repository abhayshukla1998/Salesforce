public class updateAccountWebsiteHandler {
    public static void updateAccWebsite(map<Id, Account> oldAccMap, List<Account> newAccList){
        List<Account> accList = new List<Account>();
        for(Account newAccount : newAccList){
            Account oldAccount = oldAccMap.get(newAccount.Id);
            if(oldAccount.Phone != newAccount.Phone){
                newAccount.Website = 'tech@gmail.com';
                acclist.add(newAccount);
            }
        }
    }
}