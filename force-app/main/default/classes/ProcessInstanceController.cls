public class ProcessInstanceController {
    public String processId;
    public String leadId;
    public ProcessInstance objProcessInstance;
    public Lead objLead {get; set;}
    public PageReference redirectPage;
    public ProcessInstanceController(){
      //  processId = ApexPages.currentPage().getParameters().get('id');
        leadId = ApexPages.currentPage().getParameters().get('leadId');
        objLead = [select Id,Name,Owner.Name,Rejection_Reason__c,Comments__c from Lead where id =:leadId];
        redirectPage = new PageReference('/'+leadId);system.debug(processId);system.debug(leadId);
    }
   
    public PageReference Approve(){
        Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
        req.setComments(objLead.Comments__c);
        req.setAction('Approve');
        //req.setWorkitemId(processId);
        Approval.ProcessResult result =  Approval.process(req);
        update objLead;
        return redirectPage ;
    }
   
    public PageReference Reject(){
        system.debug(processId);system.debug(leadId);
        Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
        req.setComments(objLead.Comments__c);
        req.setAction('Reject');
   //     req.setObjectId(leadId);
       ProcessInstanceWorkitem workItem  = [Select Id from ProcessInstanceWorkitem
            where ProcessInstance.TargetObjectId =: leadId];
        req.setWorkitemId(workItem.Id);
        Approval.ProcessResult result =  Approval.process(req);
        update objLead;
        return redirectPage ;      
    }
   
     public PageReference Cancel(){
     return redirectPage ;
    }
}