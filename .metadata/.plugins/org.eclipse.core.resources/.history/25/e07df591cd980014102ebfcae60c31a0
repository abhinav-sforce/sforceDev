public class RunReportSynchronously {

    public RunReportSynchronously() {

        // Get the report ID
        List <Report> reportList = [SELECT Id,DeveloperName FROM Report where DeveloperName = 'All_Accounts'];
        
        String reportId = (String)reportList.get(0).get('Id');
        
        // Run the report
        Reports.ReportResults results = Reports.ReportManager.runReport(reportId, true);
        System.debug('Synchronous results: ' + results);
    }
}