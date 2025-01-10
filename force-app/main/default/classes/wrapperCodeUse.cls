public class wrapperCodeUse {
    
    public wrapperCode wc;
    
    // Prepare the student list
    
    public List<wrapperCode> wcStudent(){
        List<wrapperCode> wcStudentList = new List<wrapperCode>();
        
        wrapperCode wCode = new wrapperCode();
        wCode.name = 'virat kohli';
        wCode.marks = 100;
        wCode.rollNo = 1;
        wCode.subject = 'Cricket';
        wcStudentList.add(wCode);
        
        return wcStudentList;
        
    }

}