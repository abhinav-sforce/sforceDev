public class StrikeIronIpLookupWebService {

    public tempuriOrg.DNSInfo info {get; set;}

    //Standard Controller
    public StrikeIronIpLookupWebService() {
            
        // Create the stub
        tempuriOrg.DNSSoap dns = new tempuriOrg.DNSSoap();
        
        // Set up the license header
        dns.LicenseInfo = new wsStrikeironCom.LicenseInfo();
        dns.LicenseInfo.RegisteredUser = new wsStrikeironCom.RegisteredUser();
        dns.LicenseInfo.RegisteredUser.UserID = 'abhinav.rs.sharma@gmail.com';
        dns.LicenseInfo.RegisteredUser.Password = '7DktYg';

        // Make the Web service call
        info = dns.DNSLookup('www.simplyforce.com');
        System.debug('@@@@@ info ' + info);    
    }    
}