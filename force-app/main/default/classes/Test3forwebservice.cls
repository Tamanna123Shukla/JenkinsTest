@RestResource(urlMapping='/demo4/*')
global class Test3forwebservice {
    @httpPost
    global static List<Account> contactForAccount(){
        Set<id> accids=new Set<id>();
        List<Account> namelist=new List<Account>();
        try{
            RestRequest req=RestContext.request;
            RestResponse res=RestContext.response;
            AggregateResult[] groupedResults = [SELECT AccountId,COUNT(Id)FROM Contact GROUP BY AccountId HAVING COUNT(Id) > 2];
            System.debug('groupedResults'+groupedResults);
           for(AggregateResult ag:groupedResults){
               accids.add((ID)ag.get('AccountId'));   
           }
            namelist=[select name from account where id=:accids];
              return namelist;
            
        }catch(Exception e){
            System.debug('exception is'+e);
            System.debug(e.getLineNumber());
            System.debug(e.getMessage());
        }
        return null;
    }
}