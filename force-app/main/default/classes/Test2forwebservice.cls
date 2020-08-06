@RestResource(urlMapping='/demo3/*')
global class Test2forwebservice {
    @httpPost
    // HTTP POST request is sent, and creates a new resource.
    global static account insertAccount(String name,String phone, String website){
        try{
            RestRequest req=RestContext.request;
            RestResponse res=RestContext.response;
            Account account = new Account();
            account.Name = name;
            account.phone = phone;
            account.website = website;
            insert account;
            // String JSONString = JSON.serialize(account.id);

            return account ;
            
            
        }catch(Exception e){
            System.debug('exception is'+e);
            System.debug(e.getLineNumber());
            System.debug(e.getMessage());
            
        }
        return null;
    }
}