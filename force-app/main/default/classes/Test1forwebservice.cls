@RestResource(urlMapping='/demo2/*')
global class Test1forwebservice {
    
      
    @HttpGet
    global static wrapclass getAll(){
         
        try{ 
              RestRequest req=RestContext.request;
              RestResponse res=RestContext.response;
            
            List<Account> acclist=new List<Account>();
            List<Contact>conlist=new List<Contact>();
           List<wrapclass> wrapclasslist = new List<wrapclass>();
             
               acclist=[select name,id from account];
            conlist=[select id,name from contact];
            wrapclass w=new wrapclass(acclist,conlist);
           
          
                 return w;  
           //  System.debug('wrapclasslist..'+w);
                }
            
            
           
        
        catch(exception e){
            System.debug('exception is'+e);
            System.debug(e.getLineNumber());
            System.debug(e.getMessage());
        }
        return null;
    }
      global class wrapclass{
         
        public List<account> acc{get;set;}
        public List<contact> con{get;set;}
          public wrapclass(List<account> acc,List<contact> con){
              this.acc=acc;
              this.con=con;
          }
          

}
   
   
}