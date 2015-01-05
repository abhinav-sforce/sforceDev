/**
  *    Description  :   Class to send user to DMI change request page for approval and related functionality.    
  *    
  *    Created By   :   Abhinav Sharma
  *
**/
public with sharing class DealerDMIReAssignmentRequest {
    
    //Instance of Account
    public Account account {get; set;}
    
    //Flag to renderd Page
    public Boolean approvalPending {get;set;}
    
    //Standard controller
    public DealerDMIReAssignmentRequest(ApexPages.StandardController stdController) {
        
        //return the record of the standard controller
        account = (Account)stdController.getRecord();
        
        //Set defalt flag value
        approvalPending = false;
        
        //Memory allocation
        transient List<ProcessInstance> pInstance = new List<ProcessInstance>();
        
        //Query through Process instance
        pInstance = [Select Id, TargetObjectId From ProcessInstance
                        Where TargetObjectId =: account.Id AND Status = 'Pending'];
        
        if(pInstance.size() > 0)
            approvalPending = true;
    }
    
    /**
      * @description  :  Method to submit Approval request to change dealer DMI. 
      *
      * @args         :  
      *
      * @return       :  void
      *
      **/
    public PageReference submitAndProcessApprovalRequest() {
        
        //Update account
        update account;
        
        //Checking for Requested DMI and DMI field values
        if(account.Requested_DMI__c != null && account.Requested_DMI__c != account.DMI__c) {
            
            // Create an approval request for the account
            Approval.ProcessSubmitRequest approvalRequest = new Approval.ProcessSubmitRequest();
            
            approvalRequest.setComments('Submit Request For Approval');
            approvalRequest.setObjectId(account.Id);
            
            // Submit the approval request for the account
            Approval.ProcessResult result = Approval.process(approvalRequest);
        }
        
        //Navigating back to account detail page
        return new PageReference('/' +account.Id);          
    }
}