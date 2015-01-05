public class XmlStreamReaderDemo {

    // Create a class Book for processing
    public class Book {
        String name;
        String author;
    }
    
	public Book[] parseBooks(XmlStreamReader reader) {
		
        Book[] books = new Book[0];
		boolean isSafeToGetNextXmlElement = true;
        
        while(isSafeToGetNextXmlElement) {

            // Start at the beginning of the book and make sure that it is a book
        	if (reader.getEventType() == XmlTag.START_ELEMENT) {
        
                if ('Book' == reader.getLocalName()) {
        
                    // Pass the book to the parseBook method (below)
                    Book book = parseBook(reader);
                    books.add(book);
        		}
			}
            
            // Always use hasNext() before calling next() to confirm
            // that we have not reached the end of the stream
            if (reader.hasNext()) {
            	reader.next();
            } else {
                isSafeToGetNextXmlElement = false;
                break;
            }
        }
		return books;
	}
    
    // Parse through the XML, determine the author and the characters
    Book parseBook(XmlStreamReader reader) {
    
        Book book = new Book();
    	book.author = reader.getAttributeValue(null, 'author');
    	boolean isSafeToGetNextXmlElement = true;
    
        while(isSafeToGetNextXmlElement) {
    		
            if (reader.getEventType() == XmlTag.END_ELEMENT) {
    			break;
            } else if (reader.getEventType() == XmlTag.CHARACTERS) {
            	book.name = reader.getText();
            }
            
			// Always use hasNext() before calling next() to confirm
            // that we have not reached the end of the stream
            if (reader.hasNext()) {
            	reader.next();
            } else {
                isSafeToGetNextXmlElement = false;
                break;
            }
        }
		return book;
	}
}