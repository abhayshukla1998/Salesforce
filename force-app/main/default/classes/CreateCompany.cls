public class CreateCompany {
   @AuraEnabled
    /*
        public static String createCompanyRecords(String fName, String laName, String email, String phone){
        Company__c comp = new Company__c();
        System.debug(fName + laName);
        comp.Name = fName +' '+laName;
        comp.Email__c = email;
        comp.Phone__c = phone;
     insert comp; 
        return comp.Id;
    }
     */
    public static String createCompanyRecords(String inputJson){
        System.debug('JSON INPUT ' + inputJson);
        CompanyWrapper cw = (CompanyWrapper) System.JSON.deserialize(inputJson,CompanyWrapper.class);
        try{
           Company__c comp = new Company__c();
        System.debug(cw.fName + cw.laName);
        comp.Name = cw.fName +' '+cw.laName;
        comp.Email__c = cw.email;
        comp.Phone__c = cw.phone;
     insert comp;
        return comp.Id; 
        }
        catch(exception ex){
            return ex.getMessage();
        }
        
    }
    public class CompanyWrapper{
        Public String fName{get;set;}
        public String laName{get;set;}
        public String email{get;set;}
        public String phone{get;set;}
    } 
}