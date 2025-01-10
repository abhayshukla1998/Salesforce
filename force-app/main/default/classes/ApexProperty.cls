public class ApexProperty {
   
    public static void SimpleProperty(){
        InnerClass obj = new InnerClass();
        obj.property = 15;
        System.debug(' obj.property = '+ obj.property );
    }
    
    public class InnerClass{
        public integer property{
            get{return property; }
            set {property = value;}
        }
    }
}