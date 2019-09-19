@RestResource(urlMapping='/sendPDFEmail')
global class GETPDFContent {
    @HttpPost
    global static void sendEmail(String surID) {
        PageReference ref = Page.TestPage;
        ref.getParameters().put('recordId',surID);
        Blob body = ref.getContentAsPDF();
        Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
        attach.setContentType('application/pdf');
        attach.setFileName('SurveyDetails.pdf');
        attach.setInline(false);
        attach.Body = body;
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setUseSignature(false);
        mail.setToAddresses(new String[] {'amshaik@teksystems.com'});
        mail.setSubject('PDF Email Demo');
        mail.setHtmlBody('Here is the email you requested! Check the attachment!');
        mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}