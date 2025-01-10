public class testinggggg {

public static void calculateGreaterNumber(){
        
// write a program to calculate grater of 3 number
integer num1 = 68677;
integer num2 = 7556;
integer num3 = 67956; 
    
if(num1>num2 && num1>num3)
{
  System.debug('Greatest Number is ' + num1);  
}
else if(num2>num1 && num2>num3)
{
  System.debug('Greatest Number is ' + num2);    
}
else
{
    System.debug('Greatest Number is ' + num3);  
}
 
    } 
 /*   Map<String,String> STCP = New Map<String,String>{'tn'=>'kn','kr'=>'tr','tn'=>'knr','up'=>'lko'};
System.debug(STCP);

Map<Integer,String> CRRNK = New Map<Integer,String>{2=>'Dhoni',3=>'Sachin',1=>'Kohli',4=>'kl',4=>'RS'};
System.debug(CRRNK);

CRRNK.put(5,'raina');
System.debug(CRRNK);

Set<Integer> k = CRRNK.keySet();
System.debug(k);

List<String> value = CRRNK.values();
System.debug(value);

// Do While Loop == First action then check condition 
Integer a = 0;
do
{
    Account acc = new Account();
    acc.Name = 'Loop Technology';
    insert acc;
    a++;
}
while(a<10);
// While Loop == First check condition then action
Integer count =0;
while(count<10)
{
    System.debug('Hit');
    count++;
}  

Integer a =0;
while(a<10)
{
   Account acc = new Account();
   acc.Name = 'While Loop Technology';
   insert acc;
   a++;
}

// For Loop == First check condition then action
for(Integer count=0;count<10;count++)
{
    System.debug('hit');
}

//For Loop for collection data type
List<String> st = new List<String>{'dl','kr','gj','up'};
System.debug(st);    

//for(DataType Var : Collection){}
for(String e : st){
    System.debug('hi ' +e);
}
// Write a program to sum upto n even number
    Integer num = 10;
    Integer count = 0;
    Integer result = 0;
    while(count<num){
        result = result + count;
        count = count +2;
    }
    System.debug(result);

// Write a program to sum upto N odd number
Integer num = 15;
Integer count = 1;
Integer result = 0;
while(count<num){
    result = result + count;
    count = count +2;
}
 System.debug(result);

  
// Write a program to sum upto N odd or even number

Integer num = 20;
Integer count;
Integer oddresult = 0;
Integer evenresult = 0;
for(count=0;count<20;count++){
    if(Math.mod(count,2) == 0){
        evenresult = evenresult + count;  
    }else{
        oddresult = oddresult + count;  
    }  
}
System.debug(evenresult);
System.debug(oddresult);

*/
    

}