import { LightningElement } from 'lwc';
import getPokemons from '@salesforce/apex/pokemonClass.getPokemons';

export default class PokemonCardList extends LightningElement {
    pokemons;
    error;

    connectedCallback(){
        getPokemons()
        .then(result =>{
            this.pokemons = result;
            console.log("this.pokemons :" + JSON.stringify(this.pokemons));
        })
        .catch(error =>{
            this.error = error;
        })
        
    }
}