public class salesforce {
    
    public static void salesforceMethod(){
      apexPropertyClass propObject = new apexPropertyClass();
        propObject.property = 1;
        system.debug('propObject.property:'+propObject.property);
    }
    //Inner Class
    public class apexPropertyClass{
        public integer property{
            get{ return property; }
            set{ property = value; }
        }   
    }
}