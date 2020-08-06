/*
* @Purpose     : It is a webservice class to get record of a perticular account id.
* Author       : Tamanna Shukla.
* Craeted Date : 25/10/2017
*/

//URL mapping
@RestResource(urlMapping='/demo1/*')

//To use  annotation @RestResource Apex class must be defined as global
global class Testforwebservice {
// HTTP GET request is sent, and returns the specified resource.    
@HttpGet
    global static Account getAccount(){
        try{
           RestRequest req=RestContext.request;
            RestResponse res=RestContext.response;
            String accid=req.params.get('id');
            Account acc=[SELECT Id, IsDeleted, MasterRecordId, Name, Type, ParentId, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, BillingLatitude, BillingLongitude, BillingGeocodeAccuracy, BillingAddress, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, ShippingLatitude, ShippingLongitude, ShippingGeocodeAccuracy, ShippingAddress, Phone, Fax, AccountNumber, Website, PhotoUrl, Sic, Industry, AnnualRevenue, NumberOfEmployees, Ownership, TickerSymbol, Description, Rating, Site, OwnerId, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, LastViewedDate, LastReferencedDate, Jigsaw, JigsawCompanyId, CleanStatus, AccountSource, DunsNumber, Tradestyle, NaicsCode, NaicsDesc, YearStarted, SicDesc, DandbCompanyId, CustomerPriority__c, SLA__c, Active__c, NumberofLocations__c, UpsellOpportunity__c, SLASerialNumber__c, SLAExpirationDate__c FROM Account where id=:accid];
            return acc;
        }catch(Exception e){
           System.debug('exception is'+e);
            System.debug(e.getLineNumber());
            System.debug(e.getMessage());
            
        }
        return null;
    }
}