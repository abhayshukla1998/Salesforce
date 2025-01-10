import { LightningElement ,wire ,track } from 'lwc';
import getStudentList from '@salesforce/apex/wireDemo.getStudentList';

const columns = [
    {label: 'Student', fieldName: 'Student_Name__c'},
    {label: 'Student Id', fieldName: 'Id'}
]
export default class WireDecoratorLwc extends LightningElement {

@track columns = columns;
@track data = [];

@wire(getStudentList)
studentDetail({data, error}){
    if(data){
        this.data = data;
    }
    else if(error){
        console.log('this is error');
    }
}
}