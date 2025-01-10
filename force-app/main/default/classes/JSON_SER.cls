public class JSON_SER {

    public void createJson(String Nm, String Ph, String Ind){
        
        System.JSONGenerator js = JSON.createGenerator(true);   // create JSON generator
        js.writeStartObject();                                 // Start writing to JSON
        try{
            Account a = new Account();
            a.Name = Nm;
            a.Phone = Ph;
            a.Industry = Ind;
            insert a;
            
            js.writeStringField('Ststus', 'Success');          // Write to JSON as per requirement
            js.writeIdField('AccId', a.id);
            js.writeStringField('Msg', 'Account Created Successfully');
            js.writeNumberField('code', 100);
            
        }
        catch(exception e){
            js.writeStringField('Ststus', 'Account');
            js.writeStringField('Msg', e.getMessage());
            js.writeNumberField('code', 200);
        }
        js.writeEndObject();                                  // End writing to JSON
        String result = js.getAsString();                    // Get the final output JSON
        System.debug(result);                               // See/Check the output
    }
}