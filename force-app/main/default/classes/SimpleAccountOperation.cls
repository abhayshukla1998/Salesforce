public class SimpleAccountOperation {
    
    public static void accountCreation(String name){
        List<Account> accountList = new  List<Account>();
        for(integer i=1;i<=10;i++){
            Account acc = new Account();
            acc.Name = name;
            accountList.add(acc);
        }
        insert accountList;
    }
}