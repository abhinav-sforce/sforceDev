public class EncodingController {
    
    public EncodingController() {
        
        DateTime d = System.now();
		String timestamp = ''+ d.year() + '-' +
                                d.month() + '-' +
                                d.day() + '\'T\'' +
                                d.hour() + ':' +
                                d.minute() + ':' +
                                d.second() + '.' +
                                d.millisecond() + '\'Z\'';
		System.debug(timestamp);

        String urlEncodedTimestamp = EncodingUtil.urlEncode(timestamp, 'UTF-8');
		System.debug(urlEncodedTimestamp);
    }
}