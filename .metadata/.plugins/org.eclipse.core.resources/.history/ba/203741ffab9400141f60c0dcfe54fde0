trigger Trigger_Job on Job__c (after insert) {
	
    if(trigger.isInsert) {
    	JobTriggerHelper.manageSharings(Trigger.new, Trigger.newMap);
    }
}