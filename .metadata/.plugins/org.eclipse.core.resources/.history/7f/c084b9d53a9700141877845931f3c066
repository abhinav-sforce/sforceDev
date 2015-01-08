public class QueueableChainingAndCalloutCon implements queueable, Database.AllowsCallouts  {
    
    public void execute(QueueableContext context) {
      
        // Send GET request
        System.debug('xxxhola');
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        req.setEndPoint('https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=API_KEY');
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        HttpResponse response = new Http().send(req);
        System.debug('xx'+response+'xx');
        
        //Chaining Jobs
        ID jobID = System.enqueueJob(new QueueableJobsController());
 
    }
}