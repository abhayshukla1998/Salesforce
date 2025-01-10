public class accountCreationWithVfPage {

    public String nam{GET;Set;}
    public String phone{GET;Set;}
    public String fax{GET;Set;}
    public String Industry{GET;Set;}
    public String Rating{GET;Set;}
    public String msg{GET;Set;}
    
    public void createAccount(){
        try{
            Account acc = new Account();
            acc.Name = nam;
            acc.Phone = phone;
            acc.Fax = fax;
            acc.Industry = Industry;
            acc.Rating = Rating;
            Insert acc;
            msg = 'Account Created Successfully Done With AccountId' + acc.Id;
        }
        catch(exception ex){
            msg = 'Error In Account Creation Is' + ex.getMessage();  
        }
    }
}