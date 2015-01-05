/**
  *    Description  :   Class to perform all approval action on DMI change request.       
  *    
  *    Created By   :   Abhinav Sharma
  **/
public with sharing class DealerDMIReAssignmentApprovalProcess {
    
    //Account type variable to bind on Page
    public Account account{get;set;}
    
    //List of ProcessInstance
    public List<ProcessInstanceWorkitem> pIWorkItem; 
    
    //List of ProcessInstanceStep
    List<ProcessInstanceStep> pIStep;
    
    //Flag to renderd Page
    public Boolean approvalPending{get;set;}
    
    //Calling Constructor
    public DealerDMIReAssignmentApprovalProcess() {
        
        //Memory allocation to the variable
        account = new Account();
        pIWorkItem = new List<ProcessInstanceWorkitem>();
        pIStep = new List<ProcessInstanceStep>();
        
        //set default value of flag
        approvalPending = false;
            
        //Getting Account Id value from the URL
        if(ApexPages.currentPage().getParameters().get('id') != null) {
            
            //Getting the account record details
            account = [Select Id, Name, DMI__c, Requested_DMI__c FROM Account Where ID =: ApexPages.currentPage().getParameters().get('id')];
            
            //Query through ProcessInstance
            pIWorkItem = [Select Id, ActorId From ProcessInstanceWorkitem where ProcessInstance.TargetObjectId =: account.Id 
                                                                              AND  ProcessInstance.Status = 'Pending'
                                                                              AND ActorId =: UserInfo.getUserId()];
                                                                                           
            //Query through ProcessInstanceStep
            pIStep = [Select Id From ProcessInstanceStep 
                      Where ProcessInstance.TargetObjectId =: account.Id AND ProcessInstance.Status= 'Pending'];
            
            if(pIWorkItem.size() > 0 ) {
                approvalPending = true;
            } else
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, 'No approval process pending'));
        }
    }
    
    /**
      * @description  :  Method to Approve DMI change Request and send Email notification to next approver. 
      *
      * @args         :  
      *
      * @return       :  void
      *
      **/
    public PageReference ApproveDMIChangeRequest() {
        
        //Update account 
        update account;
        
        //Instantiate the new ProcessWorkitemRequest
        Approval.ProcessWorkitemRequest approveRequest = new Approval.ProcessWorkitemRequest();
        
        approveRequest.setComments('Appoved By Step 1 User');
        approveRequest.setAction('Approve');
        
        //Set WorkItem Id
        approveRequest.setWorkitemId(pIWorkItem[0].Id);
        
        // Submit the request for approval
        Approval.ProcessResult result =  Approval.process(approveRequest);
        
        return new PageReference('/' +account.Id);
    }
    
    /**
      * @description  :  Method to Reject DMI change Request and send Email notification to next approver. 
      *
      * @args         :  
      *
      * @return       :  void
      *
      **/
    public PageReference RejectDMIChangeRequest() {
        
        //Instantiate the new ProcessWorkitemRequest
        Approval.ProcessWorkitemRequest rejectRequest = new Approval.ProcessWorkitemRequest();
        
        rejectRequest.setComments('Reject By Step 1');
        rejectRequest.setAction('Reject');
        
        //Set WorkItem Id
        rejectRequest.setWorkitemId(pIWorkItem[0].Id);
        
        // Submit the request for reject
        Approval.ProcessResult result =  Approval.process(rejectRequest);
        
        return new PageReference('/' +account.Id);
    }
}