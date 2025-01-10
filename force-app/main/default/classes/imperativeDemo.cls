public class imperativeDemo {
    
    @AuraEnabled
    public static List<Student__c> getStudentList(){
        List<Student__c> studentList = [Select Id,Name From Student__c];
        return studentList;
    }

}