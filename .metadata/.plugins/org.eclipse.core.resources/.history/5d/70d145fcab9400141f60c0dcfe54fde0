global class BatchSummarizeOpportunitiesAmount implements Database.Batchable<sObject>, Database.Stateful {
	
    global final String Query;
	global integer Summary;
	
    global BatchSummarizeOpportunitiesAmount(String q){
        Query=q;
		Summary = 0;
	}

	global Database.QueryLocator start(Database.BatchableContext BC){
		return Database.getQueryLocator(query);
	}
    
	global void execute(Database.BatchableContext BC, List<sObject> scope) {
		for(sObject s : scope) {
			Summary = Integer.valueOf(s.get('amount')) + Summary;
			System.debug('@@@@ intermidiate summary ' + Summary);
        }
	}
	
    global void finish(Database.BatchableContext BC) {
        System.debug('@@@@@ Total Count ' + Summary);
	}
}