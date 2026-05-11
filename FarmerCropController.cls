public with sharing class FarmerCropController {

    @AuraEnabled
    public static List<Farmer_Crop__c> getCrops() {
        return [
            SELECT Id, Farmer_Name__c, Crop_Name__c,
                   Land_Size_Acres__c, Annual_Income__c,
                   Subsidy_Eligible__c, Status__c,
                   Application_Date__c
            FROM Farmer_Crop__c
            ORDER BY Application_Date__c DESC
        ];
    }

    @AuraEnabled
    public static void updateStatus(Id cropId, String status) {

        Farmer_Crop__c crop = [
            SELECT Id, Status__c
            FROM Farmer_Crop__c
            WHERE Id = :cropId
        ];

        crop.Status__c = status;
        update crop;
    }
}