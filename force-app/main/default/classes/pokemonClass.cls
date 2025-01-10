public class pokemonClass {    
@AuraEnabled
    public static List<Pokemon__c> getPokemons(){
        List<Pokemon__c> pokemonsList = [ Select Id,Name,Height__c,image__c,Weight__c,Trainer__r.FirstName from Pokemon__c];
        if(!pokemonsList.isEmpty()){
           return pokemonsList; 
        }
        return null;
    }  
}