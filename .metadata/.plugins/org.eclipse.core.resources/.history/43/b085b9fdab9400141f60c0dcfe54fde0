@isTest
public class QueueableJobsTesting {
	
    static testmethod void test1() {
	
        // startTest/stopTest block to force async processes
		// to run in the test.
		Test.startTest();

		System.enqueueJob(new QueueableJobsController());

    	Test.stopTest();

    	// Validate that the job has run
		// by verifying that the record was created.
		// This query returns only the account created in test context by the
		// Queueable class method.
		Account acct = [SELECT Name,Phone FROM Account WHERE Name='Bosch' LIMIT 1];
		System.assertNotEquals(null, acct);
		System.assertEquals('(415) 555-1212', acct.Phone);
	}
}