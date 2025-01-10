public class foreachLoopDemo {
    
    @AuraEnabled(cacheable=true)
    public static List<Student__c> getStudentList(){
     List<Student__c> studentList = [Select Id,Name From student__c ];
        return studentList;
            
    }

}