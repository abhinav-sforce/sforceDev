// Test class for VisibleSampleClass
@isTest
private class IsTestVisibleSampleClassTest {

    // This test method can access private members of another class
    // that are annotated with @TestVisible.
    static testmethod void test1() {

        IsTestVisibleSampleClass sample = new IsTestVisibleSampleClass ();
        
        // Access private data members and update their values
        sample.recordNumber = 100;
        sample.areaCode = '(510)';
    
        // Access private inner class
        IsTestVisibleSampleClass.Employee emp = new IsTestVisibleSampleClass.Employee('Joe Smith', '555-1212');
        
        // Call private method
        String s = sample.privateMethod(emp);
    
        // Verify result
        System.assert(s.contains('(510)') && s.contains('Joe Smith') && s.contains('555-1212'));
    }

    // This test method can throw private exception defined in another class
    static testmethod void test2() {

        // Throw private exception.
        try {
            throw new IsTestVisibleSampleClass.MyException('Thrown from a test.');
        } catch(IsTestVisibleSampleClass.MyException e) {
            // Handle exception
        }
    }

    static testmethod void test3() {
        // Access public method.
        // No @TestVisible is used.
        IsTestVisibleSampleClass sample = new IsTestVisibleSampleClass ();
        sample.publicMethod();
    }
}