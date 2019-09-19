public without sharing class TestPageCtlr {
    private String recordId;
    public Survey__c survey{get;set;}
    public TestPageCtlr() {
        recordId = ApexPages.currentPage().getParameters().get('recordId');
        System.debug('>>> 1' + recordId);
        if(String.isNotBlank(recordId)) {
            survey = [SELECT Id,Name FROM Survey__c WHERE Id =: recordId];
            System.debug('>>> 2' + survey.Name);
        }
    }
}