public class CreateUpdateRecordsController {
    @AuraEnabled
    public static String saveRecords(String customerName,String email,String mobile,String status,String recordId){
        if(String.isBlank(recordId)){
        customer__c customer = new customer__c();
        customer.Name = customerName;
        customer.Email__c = email;
        customer.Mobile__c = mobile;
        customer.Active__c = status;
        if(customer!=null){
            insert customer;
        }
        return customer.Id;
    }else{
        customer__c customer = new customer__c();
        customer.Id = recordId;
        customer.Name = customerName;
        customer.Email__c = email;
        customer.Mobile__c = mobile;
        customer.Active__c = status;
if(customer!=null){
            //delete customer;
            update customer;
        }
        return customer.Id;

    }
}
}