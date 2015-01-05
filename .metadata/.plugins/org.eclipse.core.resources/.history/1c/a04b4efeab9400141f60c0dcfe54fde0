public class TypeOfClauseAndInstanceOf {
    
        // Utility method for a User
        public static void processUser(User theUser) {
        	System.debug('Processed User');
        }
    
        // Utility method for a Group
        public static void processGroup(Group theGroup) {
        	System.debug('Processed Group');
        }
    
        public static void processOwnersOfMerchandise() {
        
            // Select records based on the Owner polymorphic relationship field
        	List<Lead> merchandiseList = [SELECT TYPEOF Owner WHEN User THEN LastName 
                                             	WHEN Group THEN Email END FROM Lead LIMIT 1];
            
        // We now have a list of Lead records owned by either a User or Group
        for (Lead merch: merchandiseList) {
        
            // We can use instanceof to check the polymorphic relationship type
            // Note that we have to assign the polymorphic reference to the appropriate
            // sObject type before passing to a method
            if (merch.Owner instanceof User) {
            	User userOwner = merch.Owner;
            	processUser(userOwner);
            } else if (merch.Owner instanceof Group) {
            	Group groupOwner = merch.Owner;
            	processGroup(groupOwner);
            }
		}
	}
}