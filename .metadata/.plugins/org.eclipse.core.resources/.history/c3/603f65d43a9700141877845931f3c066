public class AddBussinessDays {

    //Calling Constructor
    public AddBussinessDays() {
    }
    
    public static Boolean IsWeekendDay(Date dateParam) {
        
        //Boolean variable to return true as a result when the day is a weekend day
        Boolean result = false;
        
        //Recover the day of the week
        Date startOfWeek = dateParam.toStartOfWeek();
        system.debug('startOfWeek = '+startOfWeek);
        
        Integer dayOfWeek  = startOfWeek.daysBetween(dateParam);
        system.debug('dayOfWeek = '+dayOfWeek);  
         
        result = dayOfWeek == 0 || dayOfWeek == 6 ? true : false;
        system.debug('result = '+result); 
        
        return result;
    } 
   
    public static Date AddBusinessDays(Date StartDate, integer BusinessDaysToAdd ) {
      
        //Add or decrease in BusinessDaysToAdd days 
        Date finalDate = StartDate;
        system.debug('finaldate = '+finalDate);
        
        integer direction = BusinessDaysToAdd < 0 ? -1 : 1;
        system.debug('direction = '+direction);
        
        while(BusinessDaysToAdd != 0) {
            finalDate = finalDate.AddDays(direction);
            system.debug('BusinessDaysToAdd = '+BusinessDaysToAdd);            
            system.debug('finaldate = '+finalDate);
            if (!isWeekendDay(finalDate)) {
                BusinessDaysToAdd -= direction;
            }
        }
        System.debug('@@@@ Finally Constructed Date ' + finalDate);
        return finalDate;
   }
}