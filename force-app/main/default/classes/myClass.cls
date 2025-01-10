public class myClass {
  static final Integer private_int_const = 1;
   
    
   static final Integer private_int_const1;
    
    public static Integer calculate(){
        return 2 + 2;
    }
    static{
        private_int_const1 = calculate();
        system.debug('private_int_const vlaue:'+private_int_const);
        system.debug('private_int_const1 vlaue:'+private_int_const1);
    }
}