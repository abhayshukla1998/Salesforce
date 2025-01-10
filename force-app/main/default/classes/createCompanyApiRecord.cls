public class createCompanyApiRecord {
  
    @AuraEnabled
    public static String createCompanyApiRecordDetail(String name, String phone){
        Company__c comp = new Company__c();
        comp.Name = name;
        comp.Phone__c = phone;
        insert comp;
        return comp.Id;
    }
}