import { LightningElement, api} from 'lwc';

export default class ChildComponent extends LightningElement {

    @api cardName = "Salesforce ";

    @api handleChangeValue(){
        this.cardName = "Salesforce Lwc";
    }
}