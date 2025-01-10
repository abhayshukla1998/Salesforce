import { LightningElement } from 'lwc';
import saveRecords from '@salesforce/apex/CreateUpdateRecordsController.saveRecords';
export default class CreateUpdateDeleteRecordComponent extends LightningElement {
    customerName;
    email;
    moblie;
    status;
    isLaoding = false;
    recordId;

customerStatus = [
    { label: 'Active', value: 'active' },
    { label: 'In Active', value: 'inactive' }
];

 get options() {
        return [
            { label: 'Active', value: 'active' },
            { label: 'In Active', value: 'inactive' },
        ]
           
    }

    handleChange(event){
        let eventName = event.target.name;
        if(eventName=='customerName'){
            this.customerName = event.target.value;
        }else if( eventName=='email'){
            this.email = event.target.value;
        }else if( eventName=='mobile'){
            this.mobile = event.target.value; 
        }else if ( eventName=='active'){
            this.status = event.detail.value;
        }

        console.log('--customerName--',this.customerName );
        console.log('--emai--',this.email );
        console.log('--mobile--',this.mobile );
        console.log('--status--',this.status );



    }
    handleClick(){
        this.isLaoding = true;
        saveRecords({customerName:this.customerName,email:this.email,mobile:this.mobile,status:this.status,recordId:this.recordId})
        .then(result =>{
            this.isLaoding = false;
            this.recordId = result;
            console.log('--customer id--',result);
        })
    .catch(error=>{
        console.log('--error--',error);
    })
    }
}