public class LocationTriggerHandler {
    @Future(Callout=true)
    public static void verifyAddress( String recordId){
        location__c loc = [Select Id, Name, Verified__c, Street__c, City__c, Postal_Code__c,
                          State__c From Location__c Where Id =:recordId];
        //&street=&city=&state=&zipcode=&match=enhanced&license=us-rooftop-geocoding-cloud
        String baseUrl = 'https://us-street.api.smarty.com/street-address?key=21102174564513388&candidates=10';
        baseUrl+= '&street='+EncodingUtil.urlEncode(loc.Street__c, 'UTF-8')
            +'&city'+EncodingUtil.urlEncode(loc.City__c,'UTF-8' )
            +'&state'+EncodingUtil.urlEncode(loc.State__c,'UTF-8' )
            +'&zipcode'+EncodingUtil.urlEncode(loc.Postal_Code__c,'UTF-8')
            +'&match=enhanced';
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.SetMethod('GET');
        httpRequest.SetEndpoint(baseUrl);
        httpRequest.SetHeader('Content-Type','application/json');
        
        Http http = new Http();
        HttpResponse httpResponse = new HttpResponse();
        
        try{
            httpResponse = http.send(httpRequest);
            System.debug('ResponseBody '+httpResponse.getBody());
            if(httpResponse.getStatuscode() == 200 & httpResponse.getStatus() == 'ok'){
                String responseBody = httpResponse.getBody();
                if(!String.isBlank(responseBody) && responseBody.length() > 2){
                   loc.Verified__c = true;  
                }else{
                    loc.Verified__c = false;
                }
            }else{
               TransactionLogHandler.doHandleExceptionWithError(httpResponse.getBody(), 'LocationTriggerHandler'); 
            }
        }catch(System.CalloutException ex){
            System.debug('Exception Executed '+ex.getStackTraceString());
            TransactionLogHandler.doHandleException(ex, 'LocationTriggerHandler');
        }
        
    }
    
}