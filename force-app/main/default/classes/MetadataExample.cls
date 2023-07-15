/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-27-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class MetadataExample {
    public void updateMetadata () {
        Metadata.CustomMetadata customMetadata  = new Metadata.CustomMetadata();
        customMetadata.fullName = 'MyNamespace__MyMetadataTypeName.MyMetadataRecordName';
        Metadata.CustomMetadataValue customField  = new Metadata.CustomMetadataValue();
        customField.field =  'customField__c';
        customField.value = 'New value';
        //List<Metadata.CustomMetadata> lstMetadata = new List<Metadata.CustomMetadata>();
        customMetadata .values.add(customField);

        Metadata.DeployContainer deployContainer  = new Metadata.DeployContainer();
        deployContainer.addMetadata(customMetadata);

        Id asyncResultId = Metadata.Operations.enqueueDeployment(deployContainer, null);
    }
}