public class SimpleDmlOperation {
    
    public static void leadCreation(){
        list<lead> leadList = new List<Lead>();
        for(integer i=1;i<=10;i++){
            Lead le = new Lead();
            le.FirstName='Virat'+i;
            le.lastName='Kohli'+i+1;
            le.City='Unnao';
            leadList.add(le);  
        } 
        
        insert leadList;  
    }
    
    
}