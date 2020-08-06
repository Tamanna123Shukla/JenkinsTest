public class ProductClass {
    public List<Opportunity>opplist{get;set;}
     public List<OpportunityLineItem> oppitems{get;set;}
    public List<SelectOption>options{get;set;}
  
           
    
    public ProductClass(ApexPages.StandardController OpportunityLineItem){
        
    }
    public  list<Opportunity>  getAllOpportunity(){
        options=new List<SelectOption>();   
           
        opplist=[select id,name,(Select product2.name,product2.Family FROM OpportunityLineItems)from opportunity where Id IN (SELECT OpportunityId FROM OpportunityLineItem WHERE Quantity > 0)];
       // oppitems=[Select product2.name,product2.Family FROM OpportunityLineItems];
     	 Schema.DescribeFieldResult fieldresult = Product2.Family.getDescribe();
         List<Schema.PicklistEntry> ple=fieldresult.getPicklistValues();
          for( Schema.PicklistEntry f : ple)
   {
      options.add(new SelectOption(f.getLabel(), f.getValue()));
   }
     return opplist;   
   }
}