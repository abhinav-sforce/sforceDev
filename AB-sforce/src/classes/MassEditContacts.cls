public class MassEditContacts {
    
    //Variable to hold the counts
    public Integer selectedRecordsSize {get; set;}
    public Integer allRecordsSize {get; set;}
    
    //Properties
    public List<Contact> contacts {get; set;}
    public Contact contact {get; set;}
    
    public String updateScope {get; set;}
  
    //Standard Set Constructor
    public MassEditContacts() {
        
        //Memory allocation
        contacts = new List<Contact>();
        contact = new Contact();
        
        //Seeting defaults
        updateScope = 'clicked';
        
        //Set to hold the selected contacts Ids strings
        Set<String> selectedContactIds = new Set<String>();
    
        //Splitting selected contact Ids from the URL
        for(String str : ApexPages.currentPage().getParameters().get('conid').split(','))
            selectedContactIds.add(str);
        
        //Querying and fetching contact records
        contacts = [Select Id, Main_Contact__c, Invoice_Contact__c From Contact Where Id IN : selectedContactIds]; 
    }

    public void saveContacts() {
        try{
            if(updateScope != 'all') {
                for(Contact c : contacts) {
                    c.Main_Contact__c = contact.Main_Contact__c;
                    c.Invoice_Contact__c = contact.Invoice_Contact__c;
                }
            } else {
                contacts = new List<Contact>();  
                if(String.isNotBlank(ApexPages.currentPage().getParameters().get('id'))) {
                    for(Contact con : [SELECT ID, Main_Contact__c, Invoice_Contact__c From Contact 
                                          WHERE AccountId =: ApexPages.currentPage().getParameters().get('id')]) {
                        con.Invoice_Contact__c = contact.Invoice_Contact__c;
                        con.Main_Contact__c = contact.Main_Contact__c;
                        contacts.add(con);
                    }
                }  
            }
            update contacts;
        }catch(exception e) {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error Occured while updating the account '+e.getMessage());
            ApexPages.addMessage(myMsg);
        }
    }
    
    public void doCancel() {}
}