@isTest
private class XmlStreamReaderDemoTest {

    // Test that the XML string contains specific values
	static testMethod void testBookParser() {

        XmlStreamReaderDemo demo = new XmlStreamReaderDemo();
		String str = '<books><book author="Chatty">Foo bar</book>' + 
            			'<book author="Sassy">Baz</book></books>';

        XmlStreamReader reader = new XmlStreamReader(str);
		XmlStreamReaderDemo.Book[] books = demo.parseBooks(reader);
		System.debug(books.size());
        for (XmlStreamReaderDemo.Book book : books) {
        	System.debug(book);
        }
	}
}