public class AccountTriggerHandler {
    
    // An Account record creation id industy ='media' or 'energy' populate rating = 'hot'
    
    public static void updateRating(List<Account> accList){
       
        for(Account acc : acclist){
            if(acc.Industry == 'Media' || acc.Industry == 'Energy'){
                acc.Rating = 'Hot';
            }
        }
    } 
    
// Upon Account creation if copyBillingToSg=hipping is checked then copy billingaddress to shippingaddress

    public static void copyBillingToShipping(List<Account> accList){
        for(Account acc : accList){
            System.debug(acc.BillingAddress);
            if(acc.BillingAddress !=null && acc.CopyBillingAddToShipping__c){
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingPostalCode= acc.BillingPostalCode;
                acc.ShippingState = acc.BillingState;
                acc.ShippingStreet = acc.BillingStreet;
            }
        }
    }
    // When Account record is created then create related Contatc as well 
    public static void createRelatedContact(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        
        for(Account acc : accList){
            Contact con = new Contact();
            con.FirstName = 'test';
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            conList.add(con);
        }
        if(!conList.isEmpty()){
            insert conList;
        }
    }
}