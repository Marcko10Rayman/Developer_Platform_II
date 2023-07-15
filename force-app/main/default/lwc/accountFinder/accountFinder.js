import { LightningElement, wire, track } from 'lwc';
import queryAccountsByRevenue  from '@salesforce/apex/AccountListControllerLwc.queryAccountsByRevenue';

export default class AccountFinder extends LightningElement {
    @track annualRevenue = 100.20;
    @track accounts;
    handleChange(event) {
        this.annualRevenue = event.detail.value;
    }

    reset() {
        this.annualRevenue = null;
    }

    @wire(
    queryAccountsByRevenue , {
        annualRevenue : '$annualRevenue'
    })
    accountData({data,error}) {
        if (data) {
            console.log('This is the data')
            console.log(data);
            this.accounts = data;
        } else if (error){
            console.log(error);
        }
    }

    
}