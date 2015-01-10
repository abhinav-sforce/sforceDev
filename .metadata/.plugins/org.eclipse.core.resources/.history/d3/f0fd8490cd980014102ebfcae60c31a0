public class ConvertToHexController {
    
    public ConvertToHexController() {
        
        String myData = 'A Test String';
        Blob hash = Crypto.generateDigest('SHA1',Blob.valueOf(myData));
        String hexDigest = EncodingUtil.convertToHex(hash);
        System.debug(hexDigest);
	}
}