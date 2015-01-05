public class LikeNonDynamicQuery {
	
    public String name {
		get { return name;}
		set { name = value;}
	}	

    public LikeNonDynamicQuery() {
	
        String queryName = '%' + name + '%';
		List<Contact> myList = [SELECT Id FROM Contact WHERE (IsDeleted = false and Name like :queryName)];
	}
}