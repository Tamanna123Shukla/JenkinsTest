public class IterationClass {
  @AuraEnabled public static list<tanna__CountryValueList__c> getAccountList() {
       List<tanna__CountryValueList__c> myCS1 = tanna__CountryValueList__c.getall().values();
      return myCS1;
  }
    }