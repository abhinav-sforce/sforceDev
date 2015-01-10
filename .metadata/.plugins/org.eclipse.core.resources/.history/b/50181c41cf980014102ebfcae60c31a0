global class ScheduleBatchSearchAndReplace implements Schedulable {
	
    global void execute(SchedulableContext sc) {
      
    	// Implement any logic to be scheduled
 		// We now call the batch class to be scheduled
      	String q = 'Select ID, Website FROM Account ORDER BY Name ASC LIMIT 4';
        String e = 'Account';
        String f = 'Website';
        String v = 'www.bosch.com';
		BatchSearchAndReplace b = new BatchSearchAndReplace(q,e,f,v);
		
        //Parameters of ExecuteBatch(context,BatchSize)
        database.executebatch(b,10);
   }
}

/*
 *  Cron EXP for hourly schedule
    String CRON_EXP = '0 0 * * * ?';
    SheduledBatchable sch = new scheduledBatchable();
	system.schedule('Hourly Example Batch Schedule job', CRON_EXP, sch);

	If you want to run it as frequent as 15,30 or N mins ....
	System.schedule('Job1', '0 * * * * ?', new SchJob());
    System.schedule('Job2', '0 15 * * * ?', new SchJob());
    System.schedule('Job3', '0 30 * * * ?', new SchJob());
    System.schedule('Job4', '0 45 * * * ?', new SchJob());
*/