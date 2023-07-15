/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-29-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountListControllerLwc {

    @AuraEnabled(cacheable=true)
    public static List<Account> queryAccountsByEmployeeNumber(Integer numberOfEmployees) {
        return [
            SELECT Name
            FROM Account
            WHERE NumberOfEmployees >= :numberOfEmployees
            LIMIT 10
        ];
    }

    @AuraEnabled
    public static List<Account> queryAccountsByRevenue(Decimal annualRevenue){
        try {
            System.debug('This is a value: ' + annualRevenue);
            return [
                SELECT Name, AnnualRevenue 
                FROM Account 
                WHERE AnnualRevenue >= : annualRevenue
            ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}