global class BatchSearchAndReplace implements Database.Batchable<sObject> {
	
    //Properties
    global final String Query;
	global final String Entity;
	global final String Field;
	global final String Value;

    //Constructor
	global BatchSearchAndReplace(String q, String e, String f, String v){
		Query=q; Entity=e; Field=f;Value=v;
	}
    
    //Start Method
	global Database.QueryLocator start(Database.BatchableContext BC){
		return Database.getQueryLocator(query);
	}
    
    //Execute
	global void execute(Database.BatchableContext BC, List<sObject> scope){
		//Loop through scope records
        for(sobject s : scope) {
			s.put(Field,Value);
        }
        System.debug('@@@@@ scope ' + scope);
		update scope;
	}
    
    //Finish Method
    global void finish(Database.BatchableContext BC) {
        
        //Chaining for thr batch jobs
        //1) Conventional Approach
        
        //Scheduling more than 5 Batch Apex jobs returns the error 
        //"Attempted to schedule too many concurrent batch jobs in this org"
		//check if there are 5 active batch jobs
		//In some cases, might need to add "Status='Queued' " to the criteria
		if ([SELECT count() FROM AsyncApexJob WHERE JobType='BatchApex' AND (Status = 'Processing' OR Status = 'Preparing')] < 5){ 
   			//Database.executeBatch(batchClassInstance);
		} else {
            //schedule this same schedulable class again in 30 mins
            //nameOfYourSchedulableClass sc = new nameOfYourSchedulableClass();
            //Datetime dt = Datetime.now() + (0.024305); // i.e. 30 mins
            //String timeForScheduler = dt.format('s m H d M \'?\' yyyy');
            //Id schedId = System.Schedule('MatrixRetry' + timeForScheduler, timeForScheduler, sc);
        }
        
        //2) Scheduling job only ones
        //String cronID = System.scheduleBatch(reassign, 'job example', 1);
		//CronTrigger ct = [SELECT Id, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :cronID];
		// TimesTriggered should be 0 because the job hasn't started yet.
		//System.assertEquals(0, ct.TimesTriggered);
		//System.debug('Next fire time: ' + ct.NextFireTime);
		// For example:
		// Next fire time: 2013-06-03 13:31:23
    }
}