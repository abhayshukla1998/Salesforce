@RestResource(urlMapping='/getDataFromTheSystem/*') 
global class codeOfApiData {
 
    @httpget
    global static List<Contact> getContact(){
        RestRequest req = RestContext.request;
        Map<String, String> mapOfData = req.Params;
        String recId = mapOfData.get('recordId');
        List<Contact> conList = [Select Id, Name From Contact Where Id =: recId];
        
        return conList;
    }
}