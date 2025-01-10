import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ShowToast extends LightningElement {

    myTitle = "Salesforce";

    handleClick(){
       this.showToast();
    }

    showToast(){
        const toastEvent = new ShowToastEvent({
            title: 'Toast Event',
            message: 'Display ShowToastEvent',
            variant: 'success',
        });

        this.dispatchEvent(toastEvent);
    }
}