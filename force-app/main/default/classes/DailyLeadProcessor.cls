/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-27-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class DailyLeadProcessor implements Schedulable {
    public void execute (SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource  = '' LIMIT 200];
        // Create a task for each opportunity in the list
        Final List<Lead> UpdateLeads = new List<Lead>();
        for(Lead Iter : leads) {
            iter.LeadSource = 'Dreamforce';
            UpdateLeads.add(iter);
        }

        Update UpdateLeads;
    }
}