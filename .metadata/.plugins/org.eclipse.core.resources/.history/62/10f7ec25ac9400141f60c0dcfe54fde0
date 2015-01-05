public class AggregateResultController {
    
    public AggregateResultController() {
        
        //Finding the average Amount for all your opportunities by campaign
        AggregateResult[] groupedResults = [SELECT CampaignId, AVG(Amount) FROM Opportunity
												GROUP BY CampaignId];
        
        for (AggregateResult ar : groupedResults) {
            System.debug('Campaign ID' + ar.get('CampaignId'));
            System.debug('Average amount' + ar.get('expr0'));
        }
    }
}