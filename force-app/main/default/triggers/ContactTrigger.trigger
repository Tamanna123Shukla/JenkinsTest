trigger ContactTrigger on Contact (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    
    if(Trigger.isInsert && Trigger.isBefore){
        System.debug('1'+trigger.new);
        System.debug('1'+trigger.old);
    }
    if(Trigger.isupdate && Trigger.isBefore){
        System.debug('2'+trigger.new);
        System.debug('2'+trigger.old);  
    }
    if(Trigger.isdelete && Trigger.isBefore){
         System.debug('3'+trigger.new);
        System.debug('3'+trigger.old); 
    }
    if(Trigger.isInsert && Trigger.isafter){
         System.debug('4'+trigger.new);
        System.debug('4'+trigger.old);  
    }
    if(Trigger.isUpdate && Trigger.isafter){
       System.debug('5'+trigger.new);
        System.debug('5'+trigger.old);   
    }
    if(Trigger.isdelete && Trigger.isafter){
       System.debug('6'+trigger.new);
        System.debug('6'+trigger.old);   
    }
    if(Trigger.isUndelete && Trigger.isafter){
       System.debug('7'+trigger.new);
        System.debug('7'+trigger.old);   
    }
}