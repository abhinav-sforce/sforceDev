public class RunReportAsynchronously {

    public RunReportAsynchronously() {
    
        // Get the report ID
        List <Report> reportList = [SELECT Id,DeveloperName FROM Report where DeveloperName = 'All_Accounts'];
        String reportId = (String)reportList.get(0).get('Id');
        
        // Run the report
        Reports.ReportInstance instance = Reports.ReportManager.runAsyncReport(reportId, true);
        System.debug('Asynchronous instance: ' + instance);
            
    }
}