/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-27-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public with sharing class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2042';

    @isTest
    static void testMet() {
        Final List<Lead> testLst = new List<Lead>();
        for (Integer i; i <=200; i++) {
            Lead tstLead = new Lead (
                LastName = 'Lead Test ' + 1,
                Company = 'Trailhead',
                MobilePhone = '5544428223',
                Status = 'Open - Not Contacted',
                LeadSource = ''
            );
            testLst.add(tstLead);
        }
        System.debug(testLst.size());
        
        Insert testLst;
        
        Test.startTest();
            String jobId = System.schedule('DailyLead',
                CRON_EXP,
                new DailyLeadProcessor());
            // Verify the scheduled job has not run yet.
            List<Lead> lt = [SELECT Id
                FROM Lead
                WHERE LeadSource = ''];
            System.assertEquals(0, lt.size(), 'Tasks exist before job has run');
            // Stopping the test will run the job synchronously
        Test.stopTest();
        // Now that the scheduled job has executed,
        // check that our tasks were created
        lt = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, lt.size(), 'Leads were not created');
    }
    
}