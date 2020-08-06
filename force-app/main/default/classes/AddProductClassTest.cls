/*
* @Purpose     : It is a test class for AddProductClass.
* Author       : Tamanna Shukla.
* Craeted Date : 06/10/2017
*/
@isTest
public class AddProductClassTest {
    // public List<Product2>prolist{get;set;}
    
    public static void setup(){
       
        PriceBook2 pb = New PriceBook2(Id =Test.getStandardPricebookId(), isActive = true);
        update pb;
        
        
        product2 pro=new product2();
        pro.Name='intel';
        pro.Family='Laptops';
        pro.ProductCode='700';
        pro.Discount__c=10;
        
        insert pro;
        
        
        
        PricebookEntry pbe1 = new PricebookEntry(Pricebook2Id = pb.Id, Product2id = pro.Id,UnitPrice = 10000, IsActive = true);
        insert pbe1;
        System.debug('pricebookentry'+pbe1);
        
        opportunity opp=new opportunity();
        opp.Name='tamanna';
        opp.CloseDate=date.today();
        opp.stageName= 'closed won';
        opp.Pricebook2Id=pb.Id;
        insert opp;
        ApexPages.StandardController sc = new ApexPages.StandardController(opp);
        AddProductClass proclass=new  AddProductClass(sc);
        
        proclass.getAllProduct();
        proclass.customSelect();
        proclass.save();
        
        
    }
    
    public testMethod static void init(){
        
        system.test.startTest();
        
        setup(); 
        
        system.test.stopTest();
    }
}