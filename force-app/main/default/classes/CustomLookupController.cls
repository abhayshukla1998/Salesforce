public with sharing class CustomLookupController {
    @AuraEnabled(cacheable=true)
    public static List<sObject> fetchLookupData(String searchKey, String sObjectApiName){
        List<sObject> returnList = new List<sObject>();
        String sWildCardText = '%'+searchKey+'%';
        String query = 'SELECT Id,Name from'+sObjectApiName+'WHERE Name Like :sWildCardText order by createdDate DESC Limit 10';
        for(sObject obj : database.query(query)){
            returnList.add(obj); 
        }
        return returnList;
    }
    @AuraEnabled
    public static sObject fetchDefaultRecord(String searchKey, String sObjectApiName){
        String sWildCardText = '%'+searchKey+'%';
        String query = 'SELECT Id,Name from'+sObjectApiName+'WHERE Name Like :sWildCardText order by createdDate DESC Limit 10';
        for(sObject obj : database.query(query)){
            return obj; 
        }
        return null;
    }
}