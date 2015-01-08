public class FieldSetDetails {
    public Contact con { get; set; }
    
    public FieldSetDetails() {
        this.con = getMerchandise();
    }
    
    public List<Schema.FieldSetMember> getFields() {
        return SObjectType.Contact.FieldSets.ConFields.getFields();
    }
    
    private Contact getMerchandise() {
        
        String query = 'SELECT ';
        
        for(Schema.FieldSetMember f : this.getFields()) {
            query += f.getFieldPath() + ', ';
        }
        query += 'Id, Name FROM Contact LIMIT 1';
        return Database.query(query);
    }
}