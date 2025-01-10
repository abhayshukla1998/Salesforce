import { LightningElement } from 'lwc';
import createCompanyRecords from '@salesforce/apex/CreateCompany.createCompanyRecords';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation';

export default class CreateCompany extends NavigationMixin (LightningElement) {

    fName='';
    laName='';
    email='';
    phone='';

    handlechange(event){
        if(event.target.name === 'first name'){
            this.fName = event.target.value;
        }
        if(event.target.name === 'last name'){
            this.laName = event.target.value;
        }
        if(event.target.name === 'phone'){
            this.phone = event.target.value;
        }
        if(event.target.name === 'email'){
            this.email = event.target.value;
        }
    }
    handleSave(){
        // for salesforce best practice we should not pass more than three parameter so we can pass one json string
        var jsonString = {'fName':this.fName, 'laName':this.laName, 'email':this.email, 'phone':this.phone};

        console.log(this.fName);
        console.log(this.laName);
        console.log(this.email);
        console.log(this.phone);
        //createCompanyRecords({fName:this.fName,laName:this.laName,email:this.email,phone:this.phone})
        createCompanyRecords({inputJson:JSON.stringify(jsonString)})
        .then(result =>{
            console.log(result);
            if(result.includes('Duplicate Record')){
                const toastEvent = new ShowToastEvent({
                    title : "error",
                    message : "Duplicate Found: " + result,
                    variant : "error" 
                });
                this.dispatchEvent(toastEvent);
            }
            else{
                    const toastEvent = new ShowToastEvent({
                        title : "success",
                        message : "Record created successfully" + result,
                        variant : "Success" 
                    });
                    this.dispatchEvent(toastEvent);
                    this[NavigationMixin.Navigate]({
                        type : 'standard__recordPage',
                        attributes : {
                            recordId : result,
                            objectApiName : 'Company__c',
                            actionName : 'view',
                        }
                    })

            }
        })
        .catch(error =>{
            console.log(error);
        }) 
    }

}