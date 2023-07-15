/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-27-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger OrderEventTrigger on Order_Event__e  (after insert) {
    // List to hold all cases to be created.
    List<Task> tasks = new List<Task>();
    Final Id userId = UserInfo.getUserId();
    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            // Create Case to dispatch new team.
            Task cs = new Task();
            cs.Priority = 'Medium';
            cs.Status = 'New';
            cs.Subject = 'Follow up on shipped order '  + event.Order_Number__c;
            cs.OwnerId = userId;
            tasks.add(cs);
        }
    }
    // Insert all cases corresponding to events received.
    insert tasks;
}