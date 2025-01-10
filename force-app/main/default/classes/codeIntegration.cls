public class codeIntegration {
    
    public static void makeCallout(){
        Http http = new Http();
        
        HttpRequest req = new HttpRequest();
         
        // for which system we need to make a request
        
         req.setEndpoint('https://api.postalpincode.in/pincode/229202');
        
        // what kind of request we are going to make means get the data or put the data
        
        req.setMethod('GET');
        //req.setTimeout(120);
        //req.setTimeout is used for set the timeout limit in milisecond
        HttpResponse res = http.send(req); // for send request
        // ( HttpResponse we use to store the response we get)
        
        // when we are making a callout then we get a status code
        if(res.getStatusCode() == 200){
            // res.getBody is used for get callout respnse
            
            System.debug('Make a callout' + res.getBody());
            
        }
        
        
        
    }
}