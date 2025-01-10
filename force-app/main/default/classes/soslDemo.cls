public class soslDemo {
    public static void getSoslResult(){
        
        List<List<sObject>> soslList = [find 'trigger' in All Fields Returning Account (Id,Name)];
        System.debug('soslList :' + soslList);
    }
    public static void getSoslResultLsit(){
        
        List<List<sObject>> soslList = [find 'test' in All Fields Returning
                                        Account (Id,Name), Contact(Id, Name)];
        System.debug('soslList :' + soslList);
    }
    public static void getSoslResultLsit1(){
        
        List<List<sObject>> soslList = [find '"test" OR "Virat"' in All Fields Returning
                                        Account (Id,Name), Contact(Id, Name)];
        System.debug('soslList :' + soslList);
    }
     public static void getSoslResultLsitQuery(){
        
        List<List<sObject>> soslList = [find 'Account*' in All Fields Returning
                                        Account (Id,Name), Contact(Id, Name)];

    }
}