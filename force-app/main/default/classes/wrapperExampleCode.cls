public class wrapperExampleCode {
     
    public wrapperExample OUS;
    public wrapperExample AUS;
    
    // prepare student list for OUS
    public List<wrapperExample> OUSTabel(){
        List<wrapperExample> OUSstList = new List<wrapperExample>();
        wrapperExample OUS = new wrapperExample();
        OUS.RollNo = 1001;
        OUS.StdName = 'Virat Kohli';
        OUS.Subject = 'MPC';
        OUS.Marks = 87;
        OUSstList.add(OUS);
        
        wrapperExample OUS1= new wrapperExample();
        OUS1.RollNo = 1002;
        OUS1.StdName = 'Subhman Gill';
        OUS1.Subject = 'MPC';
        OUS1.Marks = 88;
        OUSstList.add(OUS1);
       
        wrapperExample OUS2 = new wrapperExample();
        OUS2.RollNo = 1003;
        OUS2.StdName = 'Rohit Sharma';
        OUS2.Subject = 'MEC';
        OUS2.Marks = 89;
        OUSstList.add(OUS2);
        
        wrapperExample OUS3 = new wrapperExample();
        OUS3.RollNo = 1004;
        OUS3.StdName = 'Ravindra Jadeja';
        OUS3.Subject = 'BPC';
        OUS3.Marks = 90;
        OUSstList.add(OUS3);
        
        return OUSstList;
    }
    
    // prepare student list for AUS
    public List<wrapperExample> AUSTabel(){
        List<wrapperExample> AUSstList = new List<wrapperExample>();
        wrapperExample AUS = new wrapperExample();
        AUS.RollNo = 4001;
        AUS.StdName = 'Sachin Tendulkar';
        AUS.Subject = 'MPC';
        AUS.Marks = 91;
        AUSstList.add(AUS);
        
        wrapperExample AUS1= new wrapperExample();
        AUS1.RollNo = 4002;
        AUS1.StdName = 'Rohit Sharma';
        AUS1.Subject = 'MEC';
        AUS1.Marks = 92;
        AUSstList.add(AUS1);
       
        wrapperExample AUS2 = new wrapperExample();
        AUS2.RollNo = 4003;
        AUS2.StdName = 'MS Dhoni';
        AUS2.Subject = 'MPC';
        AUS2.Marks = 93;
        AUSstList.add(AUS2);
        
        wrapperExample AUS3 = new wrapperExample();
        AUS3.RollNo = 4004;
        AUS3.StdName = '';
        AUS3.Subject = 'BPC';
        AUS3.Marks = 89;
        AUSstList.add(AUS3);
        
        return AUSstList;
    }  
    
    // campare for duplicate between the list
    
    public void CompareStudents(){
        List<wrapperExample> OUSL = OUSTabel();
        List<wrapperExample> AUSL = AUSTabel();
        
        for(wrapperExample EOUS : OUSL){
            
            for(wrapperExample EAUS : AUSL){
                if(EOUS.StdName == EAUS.StdName){
                    System.Debug('Duplicate Name Found' + EOUS.StdName + 'OU RollNo is'+ EOUS.RollNo + 'AU RollNo is'+ EAUS.RollNo);
                }  
                } 
        }
    }
}