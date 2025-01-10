public class wireDEmo {
    
    @AuraEnabled(cacheable=true)
    public static List<Student__c> getStudentList(){
        
        List<Student__c> studentDeatails = [Select Name,Id,Roll_number__c From Student__c];
        return studentDeatails;
        
        
    }

}