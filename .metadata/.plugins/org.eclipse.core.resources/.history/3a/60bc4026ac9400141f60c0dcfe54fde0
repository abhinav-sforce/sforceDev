public class HandlingMixedDMLController {
	public static void useFutureMethod() {
		
		// First DML operation
		Account a = new Account(Name='Acme');
		insert a;

		// This next operation (insert a user with a role)
		// can't be mixed with the previous insert unless
		// it is within a future method.
		// Call future method to insert a user with a role.
		HandlingMixedDMLController.insertUserWithRole('mruiz@awcomputing.com', 'mruiz', 'mruiz@awcomputing.com', 'Ruiz');
	}
	
    @future
	public static void insertUserWithRole(String uname, String al, String em, String lname) {
		
		Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
		UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];

		// Create new user with a non-null user role ID
		User u = new User(alias = al, email=em, emailencodingkey='UTF-8', lastname=lname, languagelocalekey='en_US',
				localesidkey='en_US', profileid = p.Id, userroleid = r.Id, timezonesidkey='America/Los_Angeles',
				username=uname);
		insert u;
	}
}