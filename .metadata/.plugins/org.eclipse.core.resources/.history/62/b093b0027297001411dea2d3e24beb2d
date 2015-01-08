public class DomDocument {
    
    // Pass in the URL for the request
	// For the purposes of this sample,assume that the URL
	// returns the XML shown above in the response body
	public void parseResponseDom(String url){

        Http h = new Http();
		HttpRequest req = new HttpRequest();

        // url that returns the XML in the response body
        req.setEndpoint(url);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        Dom.Document doc = res.getBodyDocument();

        //Retrieve the root element for this document.
        Dom.XMLNode address = doc.getRootElement();
        String name = address.getChildElement('name', null).getText();
        String state = address.getChildElement('state', null).getText();

        // print out specific elements
        System.debug('Name: ' + name);
        System.debug('State: ' + state);
        
        // Alternatively, loop through the child elements.
        // This prints out all the elements of the address
        for(Dom.XMLNode child : address.getChildElements()) {
        	System.debug(child.getText());
        }
        
        /*<address>
            <name>Kirk Stevens</name>
            <street1>808 State St</street1>
            <street2>Apt. 2</street2>
            <city>Palookaville</city>
            <state>PA</state>
            <country>USA</country>
		</address>*/
	}
}