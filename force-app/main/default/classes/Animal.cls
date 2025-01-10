public virtual class Animal {
 
    public String name;
    public Integer age;
    public String color;
    
     // parameteriesed constructor
    // Animal info = new Animal('simi', 4, 'white');
    public Animal(String name, Integer age, String color){
       System.debug(this);
       this.name = name;
       this.age = age;
       this.color = color;
    }
    public virtual void displayInfo(){
       System.debug('Name is '+ name); // we can also use this keyword here(this.name)
       System.debug('Age is '+ age);   // we can also use this keyword here(this.age)
       System.debug('Color is '+ color); // we can also use this keyword here(this.color)
    }
    public void sound(){
      System.debug(name +' is sounding loud'); // we can also use this keyword here(this.name)  
    }
}