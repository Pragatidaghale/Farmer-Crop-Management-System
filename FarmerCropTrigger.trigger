trigger FarmerCropTrigger on Farmer_Crop__c (before insert, before update) {

    for (Farmer_Crop__c crop : Trigger.new) {

        if (crop.Annual_Income__c != null && crop.Land_Size_Acres__c != null) {

            if (crop.Annual_Income__c <= 100000 && crop.Land_Size_Acres__c <= 5) {
                crop.Subsidy_Eligible__c = true;
                crop.Status__c = 'Approved';
            }
            else if (crop.Annual_Income__c > 200000) {
                crop.Subsidy_Eligible__c = false;
                crop.Status__c = 'Rejected';
            }
            else {
                crop.Subsidy_Eligible__c = false;
                crop.Status__c = 'Pending';
            }
        }
    }
}
