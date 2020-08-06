public  class VME_NewVMECampaignCtrl {
    @AuraEnabled
    public static Map<String,Map<Id,Boolean>> getAllRecordTypesOfVME(){
        Map<Id,Boolean> IdMap = new  Map<Id,Boolean>();
        Map<string,Schema.RecordTypeInfo> recortypeValues= Schema.SObjectType.Account.getRecordTypeInfosByName();
for(string rt:recortypeValues.keyset()){
    Schema.RecordTypeInfo rtpeInfo=recortypeValues.get(rt);
    system.debug('****getDeveloperName:'+rtpeInfo.getName());
    system.debug('****getName:'+rtpeInfo.getName());
    system.debug('****getRecordTypeId:'+rtpeInfo.getRecordTypeId());
   system.debug('****isActive:'+rtpeInfo.isActive());
    system.debug('****isAvailable  :'+rtpeInfo.isAvailable()); 
    system.debug('****isDefaultRecordTypeMapping  :'+rtpeInfo.isDefaultRecordTypeMapping()); 
    system.debug('****isMaster  :'+rtpeInfo.isMaster()); 
}
        /*List<Schema.RecordTypeInfo> RecordTypeDetails =Schema.Sobjecttype.VME_Campaign__c.getRecordTypeInfos();
        for(Schema.RecordTypeInfo recordTypeDe : RecordTypeDetails){
            System.debug(recordTypeDe);
            if(true){
                IdMap.put(recordTypeDe.getRecordTypeId(),recordTypeDe.isDefaultRecordTypeMapping());
            }
        }*/
        return  null;
    }
}