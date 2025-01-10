public class SoqlAndAggregate {
   
    // Soql is stand for salesforce object query language
    // soql is used for query the records of the object
  
    /*
        Aggregate functions
  
  Aggregate function in soql is Used for the roll up and summrize the data in a query
   Aggregate function ==>
                   Avg()
				   Min()
				   Max()
				   Sum()
				   Count() = return the number of rows matching the query criteria
				   
		Clouse in aggregate function =
		                               Group by = Group by clouse help the aggregate function to work on group of similar records insted of indivisual records. 
									   Having = We use having clouse with a Group By clouse to filter the result returned by Aggregate function.
				   
				   Example = 
				         [Select Sum(Amount) From Oppotunity];
						 [Select LeadSource, Sum(Amount) From Opportunity Group By LeadSource];
						 [Select LeadSource, Max(Amount) From Opportunity Group By LeadSource Having Max(Amount) > 5];
						                   
                    
       
	   Write a soql to fetch all the record of account which have more than five contacts
	   [Select AccountId From Contact Group by AccountId count(Id)>5];
    */
}