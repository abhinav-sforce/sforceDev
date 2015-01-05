public class FieldsGetMapController {
    
    public List<AccountWrapper> accWrapper {get; set;}
    
    public FieldsGetMapController() {
    	accWrapper = new List<AccountWrapper>();
        Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Account.fields.getMap();
        for(String apiName : fieldMap.keySet()) {
           accWrapper.add(new AccountWrapper(apiName, fieldMap.get(apiName).getDescribe().getLabel(),
                                             	String.valueOf(fieldMap.get(apiName).getDescribe().getType()))); 
        }
    }
    
    class AccountWrapper {
    	
        public String fieldAPIName {get; set;}
        public String labelName {get; set;}
        public String typeValue {get; set;}
        
        AccountWrapper(String fieldAPIName, String labelName, String typeValue) {
            this.fieldAPIName = fieldAPIName;
            this.labelName = labelName;
            this.typeValue = typeValue;
        }
    }
}