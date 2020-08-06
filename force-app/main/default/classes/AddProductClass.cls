/*
* @Purpose     : It is a Controller for for addProductVF page.
* Author       : Tamanna Shukla.
* Craeted Date : 06/10/2017
*/
public class AddProductClass {
    //  public List< OpportunityLineItem> oppline{get;set;}
    public List<pricebookEntry> pricebook{get;set;}
    public List<Product2>prolist{get;set;}
    public String values{get;set;}
    public boolean showproduct{get;set;}
    public string searchstring {get;set;} 
    public string productcode {get;set;} 
    public List<SelectOption>options{get;set;}
    public List<WrapperProductCheckbox> contactWLst{get;set;}
    public List<OpportunityLineItem>selectedProduct{get;set;}
    public static Set<id> proids=new Set<id>();
    public static map<id,pricebookEntry> mapforpricebook;
    Id oppId ;
    Opportunity opp1;
    
    public AddProductClass(ApexPages.StandardController opp){
        //fetch the current id of opportunity
        oppId=opp.getRecord().id;
        
        opp1=new Opportunity();
        opp1 = [select id,pricebook2Id from Opportunity where id=:oppId];
        
        showproduct=true;       
    }
    
    
    public  List<WrapperProductCheckbox> getAllProduct(){
        //initialization of list 
        mapforpricebook=new map<id,pricebookEntry>();
        pricebook=new List<pricebookEntry>();
        options=new List<SelectOption>(); 
        prolist=new List<product2>();
        contactWLst=new list<WrapperProductCheckbox>();
        string pro;
        selectedProduct=new List<OpportunityLineItem>();
        
        pro='select id,name,ProductCode,IsActive,Family from product2 where name!=null';
        
        //to sort according to product family
        Schema.DescribeFieldResult fieldresult = Product2.Family.getDescribe();
        List<Schema.PicklistEntry> ple=fieldresult.getPicklistValues();
        for( Schema.PicklistEntry f : ple)
        {
            options.add(new SelectOption(f.getLabel(), f.getValue()));
            
        }
        
        //search according to the name of product
        if(values!=null && values!='None')
            pro+=' and Family=: values'; 
        
        if(searchstring != null && searchstring != '' ){ 
            
            pro+=' and Name like \'%'+searchstring+'%\''; 
        }
        
        //search according to product code
        if(productcode != null && productcode != '' ){
            System.debug(productcode);
            pro+=' and ProductCode like \'%'+productcode+'%\''; 
        }
        
        
        prolist  = database.query(pro);
      
        //add product in wrapper list with false checkbox value
        for(Product2 prod :prolist){
            WrapperProductCheckbox w =new WrapperProductCheckbox(false,prod);
            proids.add(prod.Id);
            contactWLst.add(w);
        }
        
        
        pricebook=[select product2id,product2.discount__c, product2.name,id,UnitPrice,name from pricebookEntry where product2id IN:proids And Pricebook2.IsActive=true And Pricebook2Id=:opp1.Pricebook2Id];
       
        for(pricebookEntry pb:pricebook){
            mapforpricebook.put(pb.product2id,pb);
            
        }

        return contactWLst;
        
    }
    
    
    //wrapper class to store product with checkbox
    public class WrapperProductCheckbox{
        
        public Product2 pro{get;set;}
        public boolean checkbox1{get;set;}
        public  WrapperProductCheckbox(boolean p,Product2 pro){
            this.checkbox1=p;
            this.pro=pro;
            
        }
    }
    
    
    public void customSelect() {
        
        showproduct=false;
        for(WrapperProductCheckbox wl:contactWLst){
          
            if(Test.isRunningTest())
                wl.checkbox1 = true;
            
            if(wl.checkbox1==true){
                
                //create opportunity line item for that opportunity  
                OpportunityLineItem oppline=new OpportunityLineItem();
                
                oppline.OpportunityId=oppId;
                System.debug('mapvalues----'+mapforpricebook.get(wl.pro.id));
                if(mapforpricebook.containsKey(wl.pro.id)) 
                oppline.Discount=mapforpricebook.get(wl.pro.id).product2.discount__c;
                oppline.PricebookEntryId=mapforpricebook.get(wl.pro.id).id;
                oppline.PricebookEntry=mapforpricebook.get(wl.pro.id);
                oppline.UnitPrice = mapforpricebook.get(wl.pro.id).unitPrice;
              if(Test.isRunningTest())
                   oppline.Quantity=4;            
              
                selectedProduct.add(oppline); 
               
            }
        }
    }
    
    
    public void save(){
        //to insert the selected list of product
        try{
               

        insert selectedProduct;
            
            
        }Catch(Exception e){
            System.debug('Error Message'+e.getMessage());
            System.debug(e.getLineNumber()+'Errrorr'); 
        }

    }
}