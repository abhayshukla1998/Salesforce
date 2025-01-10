public class QueueableExample implements queueable {
    public void execute(QueueableContext qx){
        System.debug('this is queueable example for job chaining');
        Contact con = new Contact();
        con.LastName = 'Queueable Contact';
        insert con;
        System.debug(con.LastName + ' is inserted');
    }

}