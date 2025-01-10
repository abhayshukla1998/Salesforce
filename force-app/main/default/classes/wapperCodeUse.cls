public class wapperCodeUse {

    public String city;
    public String location;
    public Student__c student;
    public wrapperCode wc; //Apex Object/wrapper/class
    
    public void getData(){
        city = 'gurugram';
        System.debug(city);
        location = 'India';
        System.debug(location);
        
        student = new Student__c(Student_Name__c = 'The Great India');
        System.debug(student);
        
        wc = new wrapperCode();
        wc.name = 'dhoni';
        System.debug(wc.name);
        wc.length = 100;
        System.debug(wc.length);
        wc.acc = [Select Name, Id From Account Where Name = 'Test'];
        System.debug(wc.acc);
        wc.con = [Select LastName, FirstName From Contact Limit 1];
        System.debug(wc.con);
        
    }
}