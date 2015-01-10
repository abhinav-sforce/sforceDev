public with sharing class SaveToPDF {

    // Determines whether page is rendered as a PDF or just displayed as HTML
    public String renderAs { get; set; }
    
    // Determines whether to show the "Save As PDF" interface
    public Boolean getShowPrintLink() {
        return ( (renderAs == null) || ( ! renderAs.startsWith('PDF')) );
    }
    
    // Action method to "print" to PDF
    public PageReference print() {
        renderAs = 'PDF';
        return null;
    }
}